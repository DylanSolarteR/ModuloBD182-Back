import oracleDB from "oracledb";

export const getHojaVida = async (req, res) => {
  try {
    const dbConnection = await oracleDB.getConnection("myPool");

    const { usuario } = req.params;

    const hojaVida = await dbConnection.execute(
      `
                SELECT 
                    *
                FROM 
                    HV H
                JOIN CANDIDATO C ON H.USUARIO = C.USUARIO
                JOIN INSTITUCION I ON H.CODINSTITUCION = I.CODINSTITUCION
                WHERE
                    H.USUARIO = '${usuario}'
            `
    );

    if (hojaVida.rows.length === 0) {
      return res
        .status(200)
        .json({ message: "No hay hojas de vida para el Usuario suministrado" });
    }

    return res.status(200).json(hojaVida.rows);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "Error interno del servidor" });
  }
};
