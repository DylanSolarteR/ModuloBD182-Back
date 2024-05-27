import { Router } from "express";
import { getProcesosRequerimientos, createProcesoRequerimiento } from "../controllers/procesoRequerimiento.controllers.js";

const router = Router();

//Obtener todos los Requerimientos según el CODEMPLEADO y la última Fase
router.get("/procesosRequerimientos/:codEmpleado", getProcesosRequerimientos);




//Crear un registro en la tabla PROCESOREQUERIMIENTO
router.post("/procesoRequerimiento", createProcesoRequerimiento);

export default router;