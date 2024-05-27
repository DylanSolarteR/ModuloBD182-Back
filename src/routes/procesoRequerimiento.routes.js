import { Router } from "express";
import { getProcesosRequerimientos, getUltimaFase} from "../controllers/procesoRequerimiento.controllers.js";

const router = Router();

//Obtener todas las Disciplinas
router.get("/procesosRequerimientos/:codEmpleado", getProcesosRequerimientos);

//Obtener un ProcesoRequerimiento según el idreq y idproc
router.get("/ultimaFase/:consecReque/:consecProceso", getUltimaFase);


export default router;