<?php
require_once 'conexion.php';
require_once 'dijkstra.php';

header('Content-Type: application/json');

$origen = $_POST['origen'] ?? null;
$destino = $_POST['destino'] ?? null;
$accesibilidad = $_POST['accesibilidad'] ?? 'no';

if (!$origen || !$destino) {
    echo json_encode(['error' => 'Faltan parámetros']);
    exit;
}

// Verifica si origen y destino son accesibles (si se pide accesibilidad)
function esAccesible($nombre, $conexion) {
    $stmt = $conexion->prepare("SELECT adaptada FROM estaciones WHERE nombre = ?");
    $stmt->bind_param("s", $nombre);
    $stmt->execute();
    $res = $stmt->get_result();
    if ($fila = $res->fetch_assoc()) {
        return $fila['adaptada'] == 1;
    }
    return false;
}

if ($accesibilidad === 'si') {
    $origen_ok = esAccesible($origen, $conexion);
    $destino_ok = esAccesible($destino, $conexion);

    if (!$origen_ok || !$destino_ok) {
        $msg = 'Ruta no disponible porque ';
        if (!$origen_ok && !$destino_ok) {
            $msg .= 'ni el origen ni el destino son accesibles.';
        } elseif (!$origen_ok) {
            $msg .= 'el origen no es accesible.';
        } else {
            $msg .= 'el destino no es accesible.';
        }
        echo json_encode(['error' => $msg]);
        exit;
    }
}

// Cargar el grafo con filtro según accesibilidad
$grafo = [];

$query = "
SELECT eo.nombre AS origen, ed.nombre AS destino, c.tiempo,
       eo.adaptada AS origen_adaptada, ed.adaptada AS destino_adaptada
FROM conexiones c
JOIN estaciones eo ON c.estacion_origen_id = eo.id
JOIN estaciones ed ON c.estacion_destino_id = ed.id
";

$res = $conexion->query($query);

while ($fila = $res->fetch_assoc()) {
    if ($accesibilidad === 'si' && (!$fila['origen_adaptada'] || !$fila['destino_adaptada'])) {
        continue; // saltar si alguna estación no es adaptada
    }
    $grafo[$fila['origen']][$fila['destino']] = (int)$fila['tiempo'];
}

// Ejecutar Dijkstra
$resultado = dijkstra($grafo, $origen, $destino);

if (!$resultado || empty($resultado['camino'])) {
    echo json_encode(['error' => 'No se encontró una ruta']);
} else {
    echo json_encode($resultado);
}
?>
