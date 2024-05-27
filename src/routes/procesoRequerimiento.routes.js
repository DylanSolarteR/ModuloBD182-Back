import { Router } from "express";
import { getProcesosRequerimientos } from "../controllers/procesoRequerimiento.controllers.js";

const router = Router();

//Obtener todas las Disciplinas
router.get("/procesosRequerimientos", getProcesosRequerimientos);

export default router;