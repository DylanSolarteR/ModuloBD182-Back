import oracleDB from "oracledb";

export const getPruebas = async (req, res) => {
  try {
    const dbConnection = await oracleDB.getConnection("myPool");

    const { idDisciplina } = req.params;

    const pruebas = await dbConnection.execute(
      `
                SELECT 
                    *
                FROM 
                    PRUEBA P
                JOIN DISCIPLINA D ON P.IDDISCIPLINA = P.IDDISCIPLINA
                WHERE D.IDDISCIPLINA = '${idDisciplina}'
            `
    );

    if (pruebas.rows.length === 0) {
      return res.status(404).json({ message: "Disciplinas no encontradas" });
    }

    return res.status(200).json(pruebas.rows);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "Error interno del servidor" });
  }
};
