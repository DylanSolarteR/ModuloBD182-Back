import oracleDB from "oracledb";

// GET - Obtener todos los Procesos Requerimientos
export const getProcesosRequerimientos = async (req, res) => {
    try {
        const dbConnection = await oracleDB.getConnection("myPool");

        const { codEmpleado } = req.params;

        const procesosRequerimientos = await dbConnection.execute(
            `
                SELECT *
                FROM PROCESOREQUERIMIENTO
                WHERE CODEMPLEADO = :codEmpleado
                AND IDFASE = (
                    SELECT MAX(IDFASE)
                    FROM PROCESOREQUERIMIENTO
                    WHERE CODEMPLEADO = :codEmpleado
                )
            `, { codEmpleado }
        );

        if(procesosRequerimientos.rows.length === 0) {
            return res.status(404).json({ message: 'No hay Procesos Requerimientos' })
        }

        return res.status(200).json(procesosRequerimientos.rows);
    } catch (error) {
        console.log(error);
        return res.status(500).json({ message: 'Error interno del servidor' })
    }
}

export const createProcesoRequerimiento = async (req, res) => {
    try {
        const dbConnection = await oracleDB.getConnection("myPool");

        //  Analista General  Analista Cliente
        const {consecReque, idFase, codEmpleado} = req.body;

        await dbConnection.execute(
            `
                INSERT INTO PROCESOREQUERIMIENTO (
                    CONSECREQUE, 
                    IDFASE, 
                    IDPERFIL, 
                    CODEMPLEADO,
                    FECHAINICIO
                ) VALUES (
                    :1,
                    :2,
                    '0012',
                    :3,
                    SYSDATE
                )
            `,
            [consecReque, idFase, codEmpleado],
            { autoCommit: true }
        )

        const procesoRequerimiento = await dbConnection.execute(
            `
                SELECT *
                FROM PROCESOREQUERIMIENTO
                WHERE CONSPROCESO = (
                    SELECT MAX(CONSPROCESO)
                    FROM PROCESOREQUERIMIENTO
                )
            `
        );

        return res.status(200).json(procesoRequerimiento.rows);
    } catch (error) {
        console.log(error);
        return res.status(500).json({ message: 'Error interno del servidor' })
    }
}

// GET - Obtener un ProcesoRequerimiento según el idreq y idproc
export const getUltimaFase = async (req, res) => {
    try {
        const dbConnection = await oracleDB.getConnection("myPool");

        const { consecReque, consecProceso } = req.params;

        const ultimaFase = await dbConnection.execute(
            `
                SELECT *
                FROM PROCESOREQUERIMIENTO
                WHERE CONSECREQUE = :consecReque
                AND CONSPROCESO = :consecProceso
                AND IDFASE = (
                    SELECT MAX(IDFASE)
                    FROM PROCESOREQUERIMIENTO
                    WHERE CONSECREQUE = :consecReque
                    AND CONSPROCESO = :consecProceso
                )
            `,
            [consecReque, consecProceso, consecReque, consecProceso]
        );

        if (ultimaFase.rows.length === 0) {
            return res.status(200).json({ message: 'No se encontraron fases para ese CONSECREQUE y CONSPROCESO' });
        }

        return res.status(200).json(ultimaFase.rows[0]);
    } catch (error) {
        console.log(error);
        return res.status(500).json({ message: 'Error interno del servidor' });
    }
}
