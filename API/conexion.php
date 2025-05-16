<?php
$conexion = new mysqli("172.16.12.10", "root", "Alumno00", "metroasir", 3306);
$conexion->set_charset("utf8");

if ($conexion->connect_error) {
    die("Conexión fallida: " . $conexion->connect_error);
}
?>
