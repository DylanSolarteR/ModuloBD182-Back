import oracleDB from "oracledb";

//Obtener todos los PROCCANDIDATOS a partir de CONSECREQUE, CONSPROCESO Y IDFASE
export const getProcCandidatos = async (req, res) => {
  try {
    const dbConnection = await oracleDB.getConnection("myPool");

    const { consecReque, consecProceso, idFase } = req.params;

    const procCandidatos = await dbConnection.execute(
      `
                SELECT *
                FROM PROCESOCANDIDATO
                WHERE CONSECREQUE = :consecReque
                AND CONSPROCESO = :consecProceso
                AND IDFASE = LPAD(:idFase,4,0)
            `,
      [consecReque, consecProceso, idFase]
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
