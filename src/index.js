import express from "express";
import morgan from "morgan";

import { PORT } from "./config.js";
import { connectDB } from "./db.js";

import cargoRoutes from "./routes/cargo.routes.js"
import requerimientoRoutes from "./routes/requerimiento.routes.js"

const app = express();

app.use(morgan("dev"));
app.use(express.json());

app.use(cargoRoutes);
app.use(requerimientoRoutes);

const start = async () => {
    try {
        await connectDB();
        app.listen(PORT);

        console.log("Servidor corriendo en el puerto:", PORT);
    } catch (error) {
        console.log(error);
    }
}

start();
