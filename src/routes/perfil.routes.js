import { Router } from "express";
import { getPerfiles } from "../controllers/perfil.controllers.js";

const router = Router();

//Obtener todas las Disciplinas
router.get("/perfiles/:idDisciplina", getPerfiles);

export default router;
