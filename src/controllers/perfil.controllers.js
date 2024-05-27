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

export const getPerfilDisciplina = async (req, res) => {
  try {
    const dbConnection = await oracleDB.getConnection("myPool");

    const { consecReque, idPerfil, idFase } = req.params;

    const perfilDisciplina = await dbConnection.execute(
      `
        SELECT 
            P.DESPERFIL,
            D.DESCDISCIPLINA,
            D.IDDISCIPLINA
        FROM 
            PROCESOREQUERIMIENTO PR
        JOIN 
            PERFILFASE PF ON PR.IDFASE = PF.IDFASE AND PR.IDPERFIL = PF.IDPERFIL
        JOIN 
            PERFIL P ON PF.IDPERFIL = P.IDPERFIL
        JOIN 
            DISCIPLINA D ON P.IDDISCIPLINA = D.IDDISCIPLINA
        WHERE 
            PR.CONSECREQUE = :consecReque AND PR.IDPERFIL = :idPerfil AND PR.IDFASE = :idFase
            `,
      { consecReque, idPerfil, idFase }
    );

    if (perfilDisciplina.rows.length === 0) {
      return res.status(200).json({
        message: "Descripciones de Disciplina y Perfil no encontrados",
      });
    }

    return res.status(200).json(perfilDisciplina.rows);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "Error interno del servidor" });
  }
};
