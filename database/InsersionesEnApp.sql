--Cargo

SELECT 
                    E.CODEMPLEADO,
                    E.NOMEMPLEADO,
                    E.APELLEMPLEADO,
                    E.FECHANAC,
                    E.FECHAINGRE,
                    E.FECHAEGRESO,
                    E.CORREO,
                    C.CONSECARGO,
                    C.IDTIPOCARGO,
                    C.FECHAINICIOCARGO,
                    C.FECHAFINCARGO,
                    C.DESCCARGO,
                    T.DESCTIPOCARGO
                FROM 
                    EMPLEADO E
                JOIN 
                    CARGO C ON E.CODEMPLEADO = C.CODEMPLEADO
                JOIN 
                    TIPOCARGO T ON C.IDTIPOCARGO = T.IDTIPOCARGO
                WHERE 
                    E.CORREO = '${correo}

SELECT 
                    E.CODEMPLEADO,
                    E.NOMEMPLEADO,
                    E.APELLEMPLEADO,
                    E.CORREO,
                    C.CONSECARGO,
                    C.IDTIPOCARGO,
                    C.DESCCARGO,
                    T.DESCTIPOCARGO
                FROM 
                    EMPLEADO E
                JOIN 
                    CARGO C ON E.CODEMPLEADO = C.CODEMPLEADO
                JOIN 
                    TIPOCARGO T ON C.IDTIPOCARGO = T.IDTIPOCARGO
                WHERE 
                    T.DESCTIPOCARGO = 'Analista General'

-- Disciplina

                SELECT 
                    *
                FROM 
                    DISCIPLINA

-- HV

                SELECT 
                    *
                FROM 
                    HV H
                JOIN CANDIDATO C ON H.USUARIO = C.USUARIO
                JOIN INSTITUCION I ON H.CODINSTITUCION = I.CODINSTITUCION
                WHERE
                    H.USUARIO = '${usuario}'

-- Perfil

                SELECT 
                    *
                FROM 
                    PERFIL
                WHERE 
                    IDDISCIPLINA = '${idDisciplina}'


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
            `

-- procesoCandidato

                SELECT PC.USUARIO, PC.CONSECREQUE, PC.IDFASE, PC.IDPERFIL, PC.CONSPROCESO, PC.FECHAPRESENTACION, PC.ANALISIS, PC.OBSERVACION, C.NOMBRE, C.APELLIDO
                FROM PROCESOCANDIDATO PC
                JOIN CANDIDATO C ON PC.USUARIO = C.USUARIO
                WHERE CONSECREQUE = :consecReque
                AND IDFASE = LPAD(:idFase,4,0)


                INSERT INTO PROCESOCANDIDATO (
                  USUARIO,
                  CONSECREQUE,
                  IDFASE,
                  IDPERFIL,
                  CONSPROCESO,
                  FECHAPRESENTACION
                ) VALUES (
                  :1,
                  :2,
                  :3,
                  :4,
                  :5,
                  SYSDATE

--ProcesoRequerimiento

                SELECT * FROM PROCESOREQUERIMIENTO P
                WHERE P.CODEMPLEADO = :codEmpleado
                AND IDFASE = (
                    SELECT MAX(TO_NUMBER(IDFASE))
                    FROM PROCESOREQUERIMIENTO PR
                    WHERE PR.CODEMPLEADO = :codEmpleado AND P.CONSECREQUE
                    = PR.CONSECREQUE)
                ORDER BY CONSECREQUE

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

                 SELECT *
                FROM PROCESOREQUERIMIENTO
                WHERE CONSECREQUE = :consecReque
                AND IDFASE = (
                    SELECT MAX(TO_NUMBER(IDFASE))
                    FROM PROCESOREQUERIMIENTO
                    WHERE CONSECREQUE = :consecReque
                )

                SELECT *
                FROM PROCESOREQUERIMIENTO 
                WHERE CONSECREQUE = :consecReque
                AND IDFASE = LPAD(:idFase,4,0)

--Prueba

                SELECT 
                    *
                FROM 
                    PRUEBA P
                JOIN DISCIPLINA D ON P.IDDISCIPLINA = P.IDDISCIPLINA
                WHERE D.IDDISCIPLINA = '${idDisciplina}'

--Requerimiento

                SELECT 
                    *
                FROM 
                    REQUERIMIENTO
                WHERE 
                    EMP_CODEMPLEADO = '${emp_codEmpleado}'

                SELECT 
                    *
                FROM 
                    REQUERIMIENTO R
                JOIN DISCIPLINA D ON R.IDDISCIPLINA = D.IDDISCIPLINA
                WHERE D.IDDISCIPLINA = '${idDisciplina}'


                                SELECT 
                    R.CONSECREQUE, R.CODEMPLEADO, R.EMP_CODEMPLEADO, R.SALARIOMAX, R.SALARIOMIN, R.DESFUNCION, R.DESCARRERAS, R.NVVACANTES, E.NOMEMPLEADO, E.APELLEMPLEADO
                FROM 
                    REQUERIMIENTO R
                JOIN 
                    EMPLEADO E ON R.CODEMPLEADO = E.CODEMPLEADO
                WHERE 
                    R.CONSECREQUE = '${consecReque}'

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