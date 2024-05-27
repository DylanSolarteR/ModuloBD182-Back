import { Router } from "express";
import {
  getInfoEmpleado,
  getAnalistasGenerales,
} from "../controllers/cargo.controllers.js";

const router = Router();

//Obtener todos los datos del Empleado según su Correo
router.get("/login/:correo", getInfoEmpleado);

//Obtener todos los Analistas Generales
router.get("/analistasGenerales", getAnalistasGenerales);

export default router;
