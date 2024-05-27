import { Router } from "express";
import { getPruebas } from "../controllers/prueba.controllers.js";

const router = Router();

//Obtener todas las Pruebas aplicables a la Disciplina
router.get("/pruebas/:idDisciplina", getPruebas);

export default router;
