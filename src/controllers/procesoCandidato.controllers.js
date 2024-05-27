import oracleDB from "oracledb";

//Obtener todos los PROCCANDIDATOS a partir de CONSECREQUE, CONSPROCESO Y IDFASE
export const getProcCandidatos = async (req, res) => {
  try {
    const dbConnection = await oracleDB.getConnection("myPool");

    const { consecReque, idFase } = req.params;
    const procCandidatos = await dbConnection.execute(
      `
                SELECT PC.USUARIO, PC.CONSECREQUE, PC.IDFASE, PC.IDPERFIL, PC.CONSPROCESO, PC.FECHAPRESENTACION, PC.ANALISIS, PC.OBSERVACION, C.NOMBRE, C.APELLIDO
                FROM PROCESOCANDIDATO PC
                JOIN CANDIDATO C ON PC.USUARIO = C.USUARIO
                WHERE CONSECREQUE = :consecReque
                AND IDFASE = LPAD(:idFase,4,0)
            `,
      [consecReque, idFase]
    );

    if (procCandidatos.rows.length === 0) {
      return res
        .status(200)
        .json({ message: "No se encontraron candidatos para esos parámetros" });
    }

    return res.status(200).json(procCandidatos.rows);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "Error interno del servidor" });
  }
};
