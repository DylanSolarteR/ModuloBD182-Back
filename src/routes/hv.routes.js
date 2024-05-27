import { Router } from "express";

import {
  getHojaVida,
} from "../controllers/hv.controllers.js";

const router = Router();

//Obtener la Hoja de Vida dado el usuario de la tabla CANDIDATO
router.get("/hojaVida/:usuario", getHojaVida);
export default router;