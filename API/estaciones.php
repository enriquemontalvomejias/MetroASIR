<?php
require_once 'conexion.php';
header('Content-Type: application/json');

$solo_accesibles = isset($_GET['accesibles']) && $_GET['accesibles'] === 'si';

if ($solo_accesibles) {
    $sql = "SELECT nombre FROM estaciones WHERE adaptada = 1 ORDER BY nombre ASC";
} else {
    $sql = "SELECT nombre FROM estaciones ORDER BY nombre ASC";
}

$res = $conexion->query($sql);
$estaciones = [];

while ($row = $res->fetch_assoc()) {
    $estaciones[] = $row['nombre'];
}

echo json_encode($estaciones);
?>
