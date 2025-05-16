<?php
function dijkstra($grafo, $inicio, $fin) {
    $distancia = [];
    $previo = [];
    $cola = [];

    foreach ($grafo as $nodo => $adyacentes) {
        $distancia[$nodo] = INF;
        $previo[$nodo] = null;
        $cola[$nodo] = true;
    }

    $distancia[$inicio] = 0;

    while (!empty($cola)) {
        $min = null;
        foreach ($cola as $nodo => $_) {
            if ($min === null || $distancia[$nodo] < $distancia[$min]) {
                $min = $nodo;
            }
        }

        if ($min === $fin) break;

        foreach ($grafo[$min] ?? [] as $vecino => $peso) {
            $alt = $distancia[$min] + $peso;
            if ($alt < $distancia[$vecino]) {
                $distancia[$vecino] = $alt;
                $previo[$vecino] = $min;
            }
        }

        unset($cola[$min]);
    }

    // Reconstruir camino
    $camino = [];
    for ($at = $fin; $at !== null; $at = $previo[$at]) {
        array_unshift($camino, $at);
    }

    return [
        "camino" => $camino,
        "tiempo" => $distancia[$fin]
    ];
}
?>
