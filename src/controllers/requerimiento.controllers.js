import oracleDB from "oracledb";

export const createRequerimiento = async (req, res) => {
    try {
        const dbConnection = await oracleDB.getConnection("myPool");

        const {codEmpleado, fechaReque, salarioMax, salarioMin, desFuncion, desCarreras, nVacantes} = req.body;

        const requerimiento = await dbConnection.execute(
            `
                INSERT INTO Requerimiento (Emp_codEmpleado, fechaReque, salarioMax, salarioMin, desFuncion, desCarreras, nVvacantes) 
                VALUES (${codEmpleado}, ${fechaReque}, ${salarioMax}, ${salarioMin}, ${desFuncion}, ${desCarreras}, ${nVacantes})
                RETURNING *
            `
        )

        return res.status(200).json(requerimiento.rows);
    } catch (error) {
        console.log(error);
        return res.status(500).json({ message: 'Error interno del servidor' })
    }
}