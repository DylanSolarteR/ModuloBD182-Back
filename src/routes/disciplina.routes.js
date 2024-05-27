import { Router } from "express";
import { getDisciplinas } from "../controllers/disciplina.controllers.js";

const router = Router();

//Obtener todas las Disciplinas
router.get("/disciplinas", getDisciplinas);

export default router;
