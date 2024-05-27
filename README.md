# Proyecto Backend con Node.js y Express

Este proyecto es un API REST creado con Node.js y Express. A continuación, se detallan las instrucciones para la instalación y ejecución del proyecto.

## Requisitos previos

- Node.js (versión 14 o superior)
- npm (versión 6 o superior)

## Instalación

1. Clona el repositorio en tu máquina local:

    ```bash
    git clone https://github.com/DylanSolarteR/ModuloBD182-Back.git
    ```

2. Navega al directorio del proyecto:

    ```bash
    cd ModuloDB_Backend
    ```

3. Instala las dependencias necesarias:

    ```bash
    npm i
    ```

## Configuración de la base de datos

Dentro de la carpeta `src` se encuentra el archivo `db.js` que se encarga de realizar la conexión con la base de datos. Debes modificar los campos `user`, `password` y `connectString` con los datos correspondientes a tu configuración de base de datos.

```javascript
// src/db.js