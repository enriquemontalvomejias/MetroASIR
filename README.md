# MetroASIR – Aplicación web para el cálculo de rutas en el Metro de Madrid

Este proyecto forma parte del Trabajo Fin de Ciclo del CFGS Administración de Sistemas Informáticos en Red (ASIR). Su objetivo es ofrecer una aplicación web funcional que permita calcular rutas entre estaciones del Metro de Madrid, teniendo en cuenta criterios de accesibilidad.

## 📁 Estructura del proyecto

- **API/**: Archivos PHP que gestionan la lógica del backend, conexión a base de datos y cálculo de rutas.
- **BBDD/**: Contiene el script `Estructura.sql` con la estructura y contenido de la base de datos del proyecto.
- **web/**: Interfaz HTML, CSS y JavaScript para la interacción con el usuario.
- **README.md**: Este archivo, con información básica del proyecto.

## 🚀 Cómo usar

1. **Importa la base de datos**  
   Usa el archivo `BBDD/Estructura.sql` para crear la base de datos en MariaDB/MySQL.

   ```bash
   mysql -u usuario -p < BBDD/Estructura.sql
