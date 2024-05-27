import { Router } from "express";
import {
  getProcesosRequerimientos,
  getUltimaFase,
  createProcesoRequerimiento,
} from "../controllers/procesoRequerimiento.controllers.js";

const router = Router();

//Obtener todos los Requerimientos según el CODEMPLEADO y la última Fase
router.get("/procesosRequerimientos/:codEmpleado", getProcesosRequerimientos);

//Obtener un ProcesoRequerimiento según el idreq y idproc
router.get("/procesoRequerimiento/:consecReque", getUltimaFase);

//Crear un registro en la tabla PROCESOREQUERIMIENTO
router.post("/procesoRequerimiento", createProcesoRequerimiento);

export default router;
