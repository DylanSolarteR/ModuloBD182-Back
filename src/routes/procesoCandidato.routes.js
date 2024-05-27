import { Router } from "express";
import { getProcCandidatos } from "../controllers/procesoCandidato.controllers.js";

const router = Router();

//Obtener todos los PROCCANDIDATOS a partir de CONSECREQUE, CONSPROCESO Y IDFASE
router.get("/procCandidatos/:consecReque/:idFase", getProcCandidatos);

export default router;
