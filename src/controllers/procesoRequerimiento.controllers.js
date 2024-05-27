import oracleDB from "oracledb";

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