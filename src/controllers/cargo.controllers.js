import oracleDB from "oracledb";

export const getInfoEmpleado = async (req, res) => {
    try {
        const dbConnection = await oracleDB.getConnection("myPool");

        const { correo } = req.params;

        const infoEmpleado = await dbConnection.execute(
            `
                SELECT 
                    E.CODEMPLEADO,
                    E.NOMEMPLEADO,
                    E.APELLEMPLEADO,
                    E.FECHANAC,
                    E.FECHAINGRE,
                    E.FECHAEGRESO,
                    E.CORREO,
                    C.CONSECARGO,
                    C.IDTIPOCARGO,
                    C.FECHAINICIOCARGO,
                    C.FECHAFINCARGO,
                    C.DESCCARGO,
                    T.DESCTIPOCARGO
                FROM 
                    EMPLEADO E
                JOIN 
                    CARGO C ON E.CODEMPLEADO = C.CODEMPLEADO
                JOIN 
                    TIPOCARGO T ON C.IDTIPOCARGO = T.IDTIPOCARGO
                WHERE 
                    E.CORREO = '${correo}'
            `
        );

        if(infoEmpleado.rows.length === 0) {
            return res.status(404).json({ message: 'Correo del Empleado no encontrado' })
        }

        return res.status(200).json(infoEmpleado.rows);
    } catch (error) {
        console.log(error);
        return res.status(500).json({ message: 'Error interno del servidor' })
    }
}

export const getAnalistasGenerales = async (req, res) => {
    try {
        const dbConnection = await oracleDB.getConnection("myPool");

        const analistasGenerales = await dbConnection.execute(
            `
                SELECT 
                    E.CODEMPLEADO,
                    E.NOMEMPLEADO,
                    E.APELLEMPLEADO,
                    E.CORREO,
                    C.CONSECARGO,
                    C.IDTIPOCARGO,
                    C.DESCCARGO,
                    T.DESCTIPOCARGO
                FROM 
                    EMPLEADO E
                JOIN 
                    CARGO C ON E.CODEMPLEADO = C.CODEMPLEADO
                JOIN 
                    TIPOCARGO T ON C.IDTIPOCARGO = T.IDTIPOCARGO
                WHERE 
                    T.DESCTIPOCARGO = 'Analista General'
            `
        );

        if(analistasGenerales.rows.length === 0) {
            return res.status(404).json({ message: 'Analistas Generales no encontrados' })
        }

        return res.status(200).json(analistasGenerales.rows);
    } catch (error) {
        console.log(error);
        return res.status(500).json({ message: 'Error interno del servidor' })
    }
}