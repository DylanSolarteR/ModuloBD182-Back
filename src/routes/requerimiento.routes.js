import { Router } from "express";
import { createRequerimiento } from "../controllers/requerimiento.controllers.js";

const router = Router();

//Crear registro en la tabla REQUERIMIENTO
router.post("/requerimiento", createRequerimiento);

//Actualizar
/*router.put("/requerimiento/:consecReque", (req, res) => {
    const {consecReque} = req.params;
    res.send("Actualizando Requerimiento" + consecReque)
})*/

export default router;