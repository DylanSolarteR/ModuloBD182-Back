import { Router } from "express";
import { getProcCandidatos,
        createProcesoCandidato, } from "../controllers/procesoCandidato.controllers.js";

const router = Router();

//Obtener todos los PROCCANDIDATOS a partir de CONSECREQUE, CONSPROCESO Y IDFASE
router.get("/procCandidatos/:consecReque/:idFase", getProcCandidatos);

//UN POST QUE CREA EL NUEVOPROCESACANDIDATO A PARTIR DE UN usuario,consecReque, idFase,idPerfil,ConsProceso;
router.post("/procCandidato", createProcesoCandidato);

export default router;

