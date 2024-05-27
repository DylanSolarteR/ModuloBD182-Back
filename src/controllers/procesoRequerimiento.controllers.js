import oracleDB from "oracledb";

// GET - Obtener todos los Procesos Requerimientos
export const getProcesosRequerimientos = async (req, res) => {
  try {
    const dbConnection = await oracleDB.getConnection("myPool");

    const { codEmpleado } = req.params;

    const procesosRequerimientos = await dbConnection.execute(
      `
            SELECT * FROM PROCESOREQUERIMIENTO P
            WHERE P.CODEMPLEADO = :codEmpleado
            AND IDFASE = (
                SELECT MAX(TO_NUMBER(IDFASE))
                FROM PROCESOREQUERIMIENTO PR
                WHERE PR.CODEMPLEADO = :codEmpleado AND P.CONSECREQUE
                = PR.CONSECREQUE)
            ORDER BY CONSECREQUE
            `,
      { codEmpleado }
    );

    if (procesosRequerimientos.rows.length === 0) {
      return res
        .status(404)
        .json({ message: "No hay Procesos Requerimientos" });
    }

    return res.status(200).json(procesosRequerimientos.rows);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "Error interno del servidor" });
  }
};

// GET - Obtener un ProcesoRequerimiento según el idreq y idproc
export const createProcesoRequerimiento = async (req, res) => {
  try {
    const dbConnection = await oracleDB.getConnection("myPool");

    //  Analista General  Analista Cliente
    const {
      consecReque,
      idFase,
      idPerfil,
      codEmpleado,
      convocatoria,
      invitacion,
    } = req.body;

    await dbConnection.execute(
      `
                INSERT INTO PROCESOREQUERIMIENTO (
                    CONSECREQUE, 
                    IDFASE, 
                    IDPERFIL, 
                    CODEMPLEADO,
                    FECHAINICIO,
                    CONVOCATORIA,
                    INVITACION
                ) VALUES (
                    :1,
                    :2,
                    :3,
                    :4,
                    SYSDATE,
                    :5,
                    :6
                )
            `,
      [consecReque, idFase, idPerfil, codEmpleado, convocatoria, invitacion],
      { autoCommit: true }
    );

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
    return res.status(500).json({ message: "Error interno del servidor"});
  }
};

// GET - Obtener un ProcesoRequerimiento según el idreq y idproc
export const getUltimaFase = async (req, res) => {
  try {
    const dbConnection = await oracleDB.getConnection("myPool");

    const { consecReque } = req.params;

    const ultimaFase = await dbConnection.execute(
      `
            SELECT *
            FROM PROCESOREQUERIMIENTO
            WHERE CONSECREQUE = :consecReque
            AND IDFASE = (
                SELECT MAX(TO_NUMBER(IDFASE))
                FROM PROCESOREQUERIMIENTO
                WHERE CONSECREQUE = :consecReque
            )
            `,
      { consecReque }
    );

    if (ultimaFase.rows.length === 0) {
      return res.status(200).json({
        message: "No se encontraron fases para ese CONSECREQUE y CONSPROCESO",
      });
    }

    return res.status(200).json(ultimaFase.rows[0]);
  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "Error interno del servidor" });
  }
};

//GET DE UN ProcesoRequerimiento recibiendo  su consecReque Y idFase

export const getProcesoRequerimiento = async (req, res) => {
  try {
    const dbConnection = await oracleDB.getConnection("myPool");

    const { consecReque, idFase } = req.params;

    const procesoRequerimiento = await dbConnection.execute(
      `	
                SELECT *
                FROM PROCESOREQUERIMIENTO 
                WHERE CONSECREQUE = :consecReque
                AND IDFASE = LPAD(:idFase,4,0)
            
            `,
      [consecReque, idFase]
    );

    if (procesoRequerimiento.rows.length === 0) {
      
      return res
        .status(200)
        .json({
          message: "No se encontró el ProcesoRequerimiento con esos parámetros",
        });
    }

    return res.status(200).json(procesoRequerimiento.rows[0]);

  } catch (error) {
    console.log(error);
    return res.status(500).json({ message: "Error interno del servidor" });
  }
};
