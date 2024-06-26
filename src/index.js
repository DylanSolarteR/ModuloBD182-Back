import express from "express";
import morgan from "morgan";
import cors from "cors";

import { PORT } from "./config.js";
import { connectDB } from "./db.js";

import cargoRoutes from "./routes/cargo.routes.js";
import requerimientoRoutes from "./routes/requerimiento.routes.js";
import disciplinaRoutes from "./routes/disciplina.routes.js";
import perfilRoutes from "./routes/perfil.routes.js";
import procesoRequerimientoRoutes from "./routes/procesoRequerimiento.routes.js";
import procesoCandidatoRoutes from "./routes/procesoCandidato.routes.js";
import hvRoutes from "./routes/hv.routes.js";
import pruebaRoutes from "./routes/prueba.routes.js";

const app = express();

app.use(morgan("dev"));
app.use(express.json());
app.use(cors());

app.use(cargoRoutes);
app.use(requerimientoRoutes);
app.use(disciplinaRoutes);
app.use(perfilRoutes);
app.use(procesoRequerimientoRoutes);
app.use(procesoCandidatoRoutes);
app.use(hvRoutes);
app.use(pruebaRoutes);

const start = async () => {
  try {
    await connectDB();
    app.listen(PORT);

    console.log("Servidor corriendo en el puerto:", PORT);
  } catch (error) {
    console.log(error);
  }
};

start();
