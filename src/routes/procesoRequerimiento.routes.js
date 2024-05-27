import { Router } from "express";
import { getProcesosRequerimientos } from "../controllers/procesoRequerimiento.controllers.js";

const router = Router();

//Obtener todas las Disciplinas
router.get("/procesosRequerimientos/:codEmpleado", getProcesosRequerimientos);

export default router;