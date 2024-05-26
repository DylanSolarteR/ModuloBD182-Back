import { Router } from "express";
import { getRequerimientos, createRequerimiento } from "../controllers/requerimiento.controllers.js";

const router = Router();

//Obtener todos los Requerimientos
router.get("/requerimientos/:emp_codEmpleado", getRequerimientos);

//Crear registro en la tabla REQUERIMIENTO
router.post("/requerimiento", createRequerimiento);

//Actualizar
/*router.put("/requerimiento/:consecReque", (req, res) => {
    const {consecReque} = req.params;
    res.send("Actualizando Requerimiento" + consecReque)
})*/

export default router;