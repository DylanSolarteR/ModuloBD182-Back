import oracleDB from "oracledb";

export const getPerfiles = async (req, res) => {
  try {
    const dbConnection = await oracleDB.getConnection("myPool");

    const { idDisciplina } = req.params;

    const perfiles = await dbConnection.execute(
      `
                SELECT 
                    *
                FROM 
                    PERFIL
                WHERE 
                    IDDISCIPLINA = '${idDisciplina}'
            `
    );

    if (perfiles.rows.length === 0) {
      return res
        .status(200)
        .json({ message: "La disciplina no tiene Perfiles" });
    }

    return res.status(200).json(perfiles.rows);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "Error interno del servidor" });
  }
};
