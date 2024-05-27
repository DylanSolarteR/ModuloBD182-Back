import { Router } from "express";
import {
  getPerfiles,
  getPerfilDisciplina,
} from "../controllers/perfil.controllers.js";

const router = Router();

//Obtener todas las Disciplinas
router.get("/perfiles/:idDisciplina", getPerfiles);

//Obtener DESCPERFIL Y DESDISCIPLINA dado el CONSECREQUE, el IDPERFIL y la IDFASE
router.get(
  "/descPerfilDisciplina/:consecReque/:idPerfil/:idFase",
  getPerfilDisciplina
);

export default router;
