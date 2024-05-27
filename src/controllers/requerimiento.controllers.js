import oracleDB from "oracledb";

// Obtiene todos los Requerimientos
export const getRequerimientos = async (req, res) => {
  try {
    const dbConnection = await oracleDB.getConnection("myPool");

    const { emp_codEmpleado } = req.params;

    const requerimientos = await dbConnection.execute(
      `
                SELECT 
                    *
                FROM 
                    REQUERIMIENTO
                WHERE 
                    EMP_CODEMPLEADO = '${emp_codEmpleado}'
            `
    );

    if (requerimientos.rows.length === 0) {
      return res
        .status(200)
        .json({ message: "El empleado no tiene Requerimientos" });
    }

    return res.status(200).json(requerimientos.rows);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "Error interno del servidor" });
  }
};

// Obtiene un Requerimiento según el CONSECREQUE
export const getRequerimiento = async (req, res) => {
  try {
    const dbConnection = await oracleDB.getConnection("myPool");

    const { consecReque } = req.params;

    const requerimiento = await dbConnection.execute(
      `
                SELECT 
                    R.CONSECREQUE, R.CODEMPLEADO, R.EMP_CODEMPLEADO, R.SALARIOMAX, R.SALARIOMIN, R.DESFUNCION, R.DESCARRERAS, R.NVVACANTES, E.NOMEMPLEADO, E.APELLEMPLEADO
                FROM 
                    REQUERIMIENTO R
                JOIN 
                    EMPLEADO E ON R.CODEMPLEADO = E.CODEMPLEADO
                WHERE 
                    R.CONSECREQUE = '${consecReque}'
            `
    );

    if (requerimiento.rows.length === 0) {
      return res
        .status(200)
        .json({ message: "No hay Requerimientos con ese ConsecReque" });
    }

    return res.status(200).json(requerimiento.rows);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "Error interno del servidor" });
  }
};

// Al momento de crear un Requerimiento se crea también un ProcesoRequerimiento
export const createRequerimiento = async (req, res) => {
  try {
    const dbConnection = await oracleDB.getConnection("myPool");

    //  Analista General  Analista Cliente
    const {
      codEmpleado,
      emp_codEmpleado,
      salarioMax,
      salarioMin,
      desFuncion,
      desCarreras,
      nVacantes,
    } = req.body;

    await dbConnection.execute(
      `
                INSERT INTO REQUERIMIENTO(
                    CODEMPLEADO,
                    EMP_CODEMPLEADO,
                    FECHAREQUE, 
                    SALARIOMAX, 
                    SALARIOMIN, 
                    DESFUNCION, 
                    DESCARRERAS, 
                    NVVACANTES
                ) VALUES (
                    :1,
                    :2,
                    SYSDATE,
                    :3,
                    :4,
                    :5,
                    :6,
                    :7
                )
            `,
      [
        codEmpleado,
        emp_codEmpleado,
        salarioMax,
        salarioMin,
        desFuncion,
        desCarreras,
        nVacantes,
      ],
      { autoCommit: true }
    );

    const requerimiento = await dbConnection.execute(
      `
                SELECT *
                FROM REQUERIMIENTO
                WHERE CONSECREQUE = (
                    SELECT MAX(CONSECREQUE)
                    FROM REQUERIMIENTO
                )
            `
    );

    return res.status(200).json(requerimiento.rows);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "Error interno del servidor" });
  }
};
