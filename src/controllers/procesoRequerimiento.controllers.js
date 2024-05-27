import oracleDB from "oracledb";

export const getProcesosRequerimientos = async (req, res) => {
    try {
        const dbConnection = await oracleDB.getConnection("myPool");

        const procesosRequerimientos = await dbConnection.execute(
            `
                SELECT 
                    *
                FROM 
                    PROCESOREQUERIMIENTO
                //codEmpleado
                //Última fase
            `
        );

        if(disciplinas.rows.length === 0) {
            return res.status(404).json({ message: 'Disciplinas no encontradas' })
        }

        return res.status(200).json(disciplinas.rows);
    } catch (error) {
        console.log(error);
        return res.status(500).json({ message: 'Error interno del servidor' })
    }
}