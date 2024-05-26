/*==============================================================*/
/* DBMS name:      ORACLE Version 12c                           */
/* Created on:     21/05/2024 11:41:36 a.�m.                    */
/*==============================================================*/

/*
BEGIN
   EXECUTE IMMEDIATE 'DROP SEQUENCE CONSECRESPUESTA_NEW';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -2289 THEN
         RAISE;
      END IF;
END;
/
*/

CREATE SEQUENCE CONSECRESPUESTA_NEW
   MINVALUE 1 
   MAXVALUE 999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;

CREATE OR REPLACE TRIGGER trg_CONSECRESPUESTA
BEFORE INSERT ON RESPUESTA
FOR EACH ROW
BEGIN
    :NEW.CONSECRESPUESTA := CONSECRESPUESTA_NEW.NEXTVAL;
END;
/
-----------------------------------------------------------
/*BEGIN
   EXECUTE IMMEDIATE 'DROP SEQUENCE CONSEPREGUNTA_SEQ';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -2289 THEN
         RAISE;
      END IF;
END;
/
*/

CREATE SEQUENCE CONSEPREGUNTA_SEQ
   MINVALUE 1 
   MAXVALUE 99999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;

CREATE OR REPLACE TRIGGER trg_CONSEPREGUNTA
BEFORE INSERT ON PREGUNTA
FOR EACH ROW
BEGIN
    :NEW.CONSEPREGUNTA := CONSEPREGUNTA_SEQ.NEXTVAL;
END;
/

-------------------------------------------------

/*
BEGIN
   EXECUTE IMMEDIATE 'DROP SEQUENCE CONSECRESCANDI_SEQ';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -2289 THEN
         RAISE;
      END IF;
END;
/
*/

CREATE SEQUENCE CONSECRESCANDI_SEQ
   MINVALUE 1 
   MAXVALUE 9999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;

CREATE OR REPLACE TRIGGER trg_CONSECRESCANDI
BEFORE INSERT ON RESPUESTACANDIDATO
FOR EACH ROW
BEGIN
    :NEW.CONSECRESCANDI := CONSECRESCANDI_SEQ.NEXTVAL;
END;
/

--------------------------------------------------

/*
BEGIN
   EXECUTE IMMEDIATE 'DROP SEQUENCE CONSEPRUEBACANDI_SEQ';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -2289 THEN
         RAISE;
      END IF;
END;
/
*/

CREATE SEQUENCE CONSEPRUEBACANDI_SEQ
   MINVALUE 1 
   MAXVALUE 99999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;


CREATE OR REPLACE TRIGGER trg_CONSEPRUEBACANDI
BEFORE INSERT ON PRUEBACANDIDATO
FOR EACH ROW
BEGIN
    :NEW.CONSEPRUEBACANDI := CONSEPRUEBACANDI_SEQ.NEXTVAL;
END;
/
-----------------------------------------------------------

/*
BEGIN
   EXECUTE IMMEDIATE 'DROP SEQUENCE CONSEFASECARGO_SEQ';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -2289 THEN
         RAISE;
      END IF;
END;
/
*/

CREATE SEQUENCE CONSEFASECARGO_SEQ
   MINVALUE 1 
   MAXVALUE 9999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;

CREATE OR REPLACE TRIGGER trg_CONSEFASECARGO
BEFORE INSERT ON FASECARGO
FOR EACH ROW
BEGIN
    :NEW.CONSEFASECARGO := CONSEFASECARGO_SEQ.NEXTVAL;
END;
/

-------------------------------------------------------------

/*
BEGIN
   EXECUTE IMMEDIATE 'DROP SEQUENCE CONSECARGO_SEQ';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -2289 THEN
         RAISE;
      END IF;
END;
/
*/

CREATE SEQUENCE CONSECARGO_SEQ
   MINVALUE 1 
   MAXVALUE 9999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;

CREATE OR REPLACE TRIGGER trg_CONSECARGO
BEFORE INSERT ON CARGO
FOR EACH ROW
BEGIN
    :NEW.CONSECARGO := CONSECARGO_SEQ.NEXTVAL;
END;
/

------------------------------------------------------------

/*
BEGIN
   EXECUTE IMMEDIATE 'DROP SEQUENCE CONSECONTACLIENTE_SEQ';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -2289 THEN
         RAISE;
      END IF;
END;
/
*/

CREATE SEQUENCE CONSECONTACLIENTE_SEQ
   MINVALUE 1 
   MAXVALUE 999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;

CREATE OR REPLACE TRIGGER trg_CONSECONTACLIENTE
BEFORE INSERT ON CONTACTOCLIENTE
FOR EACH ROW
BEGIN
    :NEW.CONSECONTACLIENTE := CONSECONTACLIENTE_SEQ.NEXTVAL;
END;
/

------------------------------------------------------------

/*
BEGIN
   EXECUTE IMMEDIATE 'DROP SEQUENCE CONSECREQUE_SEQ';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -2289 THEN
         RAISE;
      END IF;
END;
/
*/

CREATE SEQUENCE CONSECREQUE_SEQ
   MINVALUE 1 
   MAXVALUE 99999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;

CREATE OR REPLACE TRIGGER trg_CONSECREQUE
BEFORE INSERT ON REQUERIMIENTO
FOR EACH ROW
BEGIN
    :NEW.CONSECREQUE := CONSECREQUE_SEQ.NEXTVAL;
END;
/

------------------------------------------------------------

/*
BEGIN
   EXECUTE IMMEDIATE 'DROP SEQUENCE CONSECREQUE_PROC_SEQ';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -2289 THEN
         RAISE;
      END IF;
END;
/
*/

CREATE SEQUENCE CONSECREQUE_PROC_SEQ
   MINVALUE 1 
   MAXVALUE 99999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;

CREATE OR REPLACE TRIGGER trg_CONSECREQUE_PROC
BEFORE INSERT ON PROCESOREQUERIMIENTO
FOR EACH ROW
BEGIN
    :NEW.CONSECREQUE := CONSECREQUE_PROC_SEQ.NEXTVAL;
END;
/

------------------------------------------------------------

/*
BEGIN
   EXECUTE IMMEDIATE 'DROP SEQUENCE CONSECONTACANDI_SEQ';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -2289 THEN
         RAISE;
      END IF;
END;
/
*/

CREATE SEQUENCE CONSECONTACANDI_SEQ
   MINVALUE 1 
   MAXVALUE 9999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;

CREATE OR REPLACE TRIGGER trg_CONSECONTACANDI
BEFORE INSERT ON CONTACTOCANDIDATO
FOR EACH ROW
BEGIN
    :NEW.CONSECONTACANDI := CONSECONTACANDI_SEQ.NEXTVAL;
END;
/

------------------------------------------------------------

/*
BEGIN
   EXECUTE IMMEDIATE 'DROP SEQUENCE CONSEHV_SEQ';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -2289 THEN
         RAISE;
      END IF;
END;
/
*/

CREATE SEQUENCE CONSEHV_SEQ
   MINVALUE 1 
   MAXVALUE 999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;

CREATE OR REPLACE TRIGGER trg_CONSEHV
BEFORE INSERT ON HV
FOR EACH ROW
BEGIN
    :NEW.CONSEHV := CONSEHV_SEQ.NEXTVAL;
END;
/

/*==============================================================*/
/* Table: CANDIDATO                                             */
/*==============================================================*/
create table CANDIDATO (
   USUARIO              VARCHAR2(30)          not null,
   IDTIPODOC            VARCHAR2(3)           not null,
   IDDISCIPLINA2        VARCHAR2(4)           not null,
   NOMBRE               VARCHAR2(30)          not null,
   APELLIDO             VARCHAR2(30)          not null,
   FECHANAC             DATE                  not null,
   NDOC                 NUMBER(15)            not null,
   constraint PK_CANDIDATO primary key (USUARIO)
);

/*==============================================================*/
/* Index: DIS2_CAN_FK                                           */
/*==============================================================*/
create index DIS2_CAN_FK on CANDIDATO (
   IDDISCIPLINA2 ASC
);

/*==============================================================*/
/* Index: TIPODOC_CAND_FK                                       */
/*==============================================================*/
create index TIPODOC_CAND_FK on CANDIDATO (
   IDTIPODOC ASC
);

/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO (
   CONSECARGO           NUMBER(4,0)           not null,
   CODEMPLEADO          VARCHAR2(5)           not null,
   IDTIPOCARGO          VARCHAR2(3)           not null,
   FECHAINICIOCARGO     DATE                  not null,
   FECHAFINCARGO        DATE,
   DESCCARGO            VARCHAR2(30)          not null,
   constraint PK_CARGO primary key (CONSECARGO)
);

/*==============================================================*/
/* Index: EMP_CAR_FK                                            */
/*==============================================================*/
create index EMP_CAR_FK on CARGO (
   CODEMPLEADO ASC
);

/*==============================================================*/
/* Index: TIPCA_CA_FK                                           */
/*==============================================================*/
create index TIPCA_CA_FK on CARGO (
   IDTIPOCARGO ASC
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   NIT                  NUMBER(12,0)          not null,
   RAZONSOCIAL          VARCHAR2(40)          not null,
   URL                  VARCHAR2(30),
   constraint PK_CLIENTE primary key (NIT)
);

/*==============================================================*/
/* Table: CONTACTOCANDIDATO                                     */
/*==============================================================*/
create table CONTACTOCANDIDATO (
   CONSECONTACANDI      NUMBER(4)             not null,
   USUARIO              VARCHAR2(30)          not null,
   IDTIPOCONTACTO2      VARCHAR2(3)           not null,
   constraint PK_CONTACTOCANDIDATO primary key (CONSECONTACANDI)
);

/*==============================================================*/
/* Index: CANT_CONTCAN_FK                                       */
/*==============================================================*/
create index CANT_CONTCAN_FK on CONTACTOCANDIDATO (
   USUARIO ASC
);

/*==============================================================*/
/* Index: TIPCON2_CONCAN_FK                                     */
/*==============================================================*/
create index TIPCON2_CONCAN_FK on CONTACTOCANDIDATO (
   IDTIPOCONTACTO2 ASC
);

/*==============================================================*/
/* Table: CONTACTOCLIENTE                                       */
/*==============================================================*/
create table CONTACTOCLIENTE (
   NIT                  NUMBER(12,0)          not null,
   CONSECONTACLIENTE    NUMBER(3,0)           not null,
   IDTIPOCARGO          VARCHAR2(3)           not null,
   IDTIPOCONTACTO       VARCHAR2(3)           not null,
   NOMBREAPELLIDOCLIEN  VARCHAR2(30)          not null,
   ACTIVOCONTACLIENTE   SMALLINT              not null,
   constraint PK_CONTACTOCLIENTE primary key (NIT, CONSECONTACLIENTE)
);

/*==============================================================*/
/* Index: TCAR_CONCLI_FK                                        */
/*==============================================================*/
create index TCAR_CONCLI_FK on CONTACTOCLIENTE (
   IDTIPOCARGO ASC
);

/*==============================================================*/
/* Index: CLI_CONCLI_FK                                         */
/*==============================================================*/
create index CLI_CONCLI_FK on CONTACTOCLIENTE (
   NIT ASC
);

/*==============================================================*/
/* Index: TCON_CONCLI_FK                                        */
/*==============================================================*/
create index TCON_CONCLI_FK on CONTACTOCLIENTE (
   IDTIPOCONTACTO ASC
);

/*==============================================================*/
/* Table: DETALLEFACTURA                                        */
/*==============================================================*/
create table DETALLEFACTURA (
   NFACTURA             VARCHAR2(6)           not null,
   ITEM                 NUMBER(4,0)           not null,
   constraint PK_DETALLEFACTURA primary key (NFACTURA, ITEM)
);

/*==============================================================*/
/* Index: FAC_DETFAC_FK                                         */
/*==============================================================*/
create index FAC_DETFAC_FK on DETALLEFACTURA (
   NFACTURA ASC
);

/*==============================================================*/
/* Table: DISCIPLINA                                            */
/*==============================================================*/
create table DISCIPLINA (
   IDDISCIPLINA         VARCHAR2(4)           not null,
   DESCDISCIPLINA       VARCHAR2(30)          not null,
   constraint PK_DISCIPLINA primary key (IDDISCIPLINA)
);

/*==============================================================*/
/* Table: DISCIPLINA2                                           */
/*==============================================================*/
create table DISCIPLINA2 (
   IDDISCIPLINA2        VARCHAR2(4)           not null,
   DESCDISCIPLINA       VARCHAR2(30)          not null,
   constraint PK_DISCIPLINA2 primary key (IDDISCIPLINA2)
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   CODEMPLEADO          VARCHAR2(5)           not null,
   NOMEMPLEADO          VARCHAR2(30)          not null,
   APELLEMPLEADO        VARCHAR2(30)          not null,
   FECHANAC             DATE                  not null,
   FECHAINGRE           DATE                  not null,
   FECHAEGRESO          DATE,
   CORREO               VARCHAR2(30)          not null,
   constraint PK_EMPLEADO primary key (CODEMPLEADO)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   NFACTURA             VARCHAR2(6)           not null,
   CODEMPLEADO          VARCHAR2(5)           not null,
   NIT                  NUMBER(12,0)          not null,
   FECHAFACTURA         DATE                  not null,
   constraint PK_FACTURA primary key (NFACTURA)
);

/*==============================================================*/
/* Index: EMP_FAC_FK                                            */
/*==============================================================*/
create index EMP_FAC_FK on FACTURA (
   CODEMPLEADO ASC
);

/*==============================================================*/
/* Index: CLI_FACT_FK                                           */
/*==============================================================*/
create index CLI_FACT_FK on FACTURA (
   NIT ASC
);

/*==============================================================*/
/* Table: FASE                                                  */
/*==============================================================*/
create table FASE (
   IDFASE               VARCHAR2(4)           not null,
   DESFASE              VARCHAR2(25)          not null,
   constraint PK_FASE primary key (IDFASE)
);

/*==============================================================*/
/* Table: FASECARGO                                             */
/*==============================================================*/
create table FASECARGO (
   CONSEFASECARGO       NUMBER(4,0)           not null,
   IDTIPOCARGO          VARCHAR2(3),
   IDFASE               VARCHAR2(4),
   constraint PK_FASECARGO primary key (CONSEFASECARGO)
);

/*==============================================================*/
/* Index: TCAR_FCAR_FK                                          */
/*==============================================================*/
create index TCAR_FCAR_FK on FASECARGO (
   IDTIPOCARGO ASC
);

/*==============================================================*/
/* Index: F_FCAR_FK                                             */
/*==============================================================*/
create index F_FCAR_FK on FASECARGO (
   IDFASE ASC
);

/*==============================================================*/
/* Table: HV                                                    */
/*==============================================================*/
create table HV (
   CONSEHV              NUMBER(3,0)           not null,
   IDTIPOITEMPERFIL4    VARCHAR2(4)           not null,
   CODINSTITUCION       NUMBER(5,0)           not null,
   USUARIO              VARCHAR2(30)          not null,
   FECHAINIACT          DATE                  not null,
   FECHAFINACT          DATE,
   DESCACTIVIDAD        VARCHAR2(50)          not null,
   FUNCIONACTIVIDAD     VARCHAR2(50),
   constraint PK_HV primary key (CONSEHV)
);

/*==============================================================*/
/* Index: TIPOITP2_HV_FK                                        */
/*==============================================================*/
create index TIPOITP2_HV_FK on HV (
   IDTIPOITEMPERFIL4 ASC
);

/*==============================================================*/
/* Index: INS_HV_FK                                             */
/*==============================================================*/
create index INS_HV_FK on HV (
   CODINSTITUCION ASC
);

/*==============================================================*/
/* Index: CAN_HV_FK                                             */
/*==============================================================*/
create index CAN_HV_FK on HV (
   USUARIO ASC
);

/*==============================================================*/
/* Table: INSTITUCION                                           */
/*==============================================================*/
create table INSTITUCION (
   CODINSTITUCION       NUMBER(5,0)           not null,
   NOMINSTITUCION       VARCHAR2(40)          not null,
   constraint PK_INSTITUCION primary key (CODINSTITUCION)
);

/*==============================================================*/
/* Table: ITEMPERFIL                                            */
/*==============================================================*/
create table ITEMPERFIL (
   IDITEM               NUMBER(4,0)           not null,
   IDPERFIL             VARCHAR2(4)           not null,
   IDTIPOITEMPERFIL     VARCHAR2(4)           not null,
   DESCITEM             VARCHAR2(30)          not null,
   constraint PK_ITEMPERFIL primary key (IDITEM)
);

/*==============================================================*/
/* Index: PERF_ITEMPER_FK                                       */
/*==============================================================*/
create index PERF_ITEMPER_FK on ITEMPERFIL (
   IDPERFIL ASC
);

/*==============================================================*/
/* Index: TIPOIP_IP_FK                                          */
/*==============================================================*/
create index TIPOIP_IP_FK on ITEMPERFIL (
   IDTIPOITEMPERFIL ASC
);

/*==============================================================*/
/* Table: PERFIL                                                */
/*==============================================================*/
create table PERFIL (
   IDPERFIL             VARCHAR2(4)           not null,
   IDDISCIPLINA         VARCHAR2(4)           not null,
   DESPERFIL            VARCHAR2(50)          not null,
   constraint PK_PERFIL primary key (IDPERFIL)
);

/*==============================================================*/
/* Index: DIS_PER_FK                                            */
/*==============================================================*/
create index DIS_PER_FK on PERFIL (
   IDDISCIPLINA ASC
);

/*==============================================================*/
/* Table: PERFILFASE                                            */
/*==============================================================*/
create table PERFILFASE (
   IDFASE               VARCHAR2(4)           not null,
   IDPERFIL             VARCHAR2(4)           not null,
   constraint PK_PERFILFASE primary key (IDFASE, IDPERFIL)
);

/*==============================================================*/
/* Index: PER_PERFASE_FK                                        */
/*==============================================================*/
create index PER_PERFASE_FK on PERFILFASE (
   IDPERFIL ASC
);

/*==============================================================*/
/* Index: F_PF_FK                                               */
/*==============================================================*/
create index F_PF_FK on PERFILFASE (
   IDFASE ASC
);

/*==============================================================*/
/* Table: PREGUNTA                                              */
/*==============================================================*/
create table PREGUNTA (
   IDPRUEBA             VARCHAR2(5)           not null,
   CONSEPREGUNTA        NUMBER(5,0)           not null,
   IDTIPOPREGUNTA       VARCHAR2(4)           not null,
   DESCPREGUNTA         VARCHAR2(30)          not null,
   constraint PK_PREGUNTA primary key (IDPRUEBA, CONSEPREGUNTA)
);

/*==============================================================*/
/* Index: PRUB_PREGUNTA_FK                                      */
/*==============================================================*/
create index PRUB_PREGUNTA_FK on PREGUNTA (
   IDPRUEBA ASC
);

/*==============================================================*/
/* Index: TIPOP_P_FK                                            */
/*==============================================================*/
create index TIPOP_P_FK on PREGUNTA (
   IDTIPOPREGUNTA ASC
);

/*==============================================================*/
/* Table: PREGUNTACANDIDATO                                     */
/*==============================================================*/
create table PREGUNTACANDIDATO (
   CONSEPRUEBACANDI     NUMBER(5,0)           not null,
   IDPRUEBA             VARCHAR2(5)           not null,
   CONSEPREGUNTA        NUMBER(5,0)           not null,
   constraint PK_PREGUNTACANDIDATO primary key (CONSEPRUEBACANDI, IDPRUEBA, CONSEPREGUNTA)
);

/*==============================================================*/
/* Index: P_PC_FK                                               */
/*==============================================================*/
create index P_PC_FK on PREGUNTACANDIDATO (
   IDPRUEBA ASC,
   CONSEPREGUNTA ASC
);

/*==============================================================*/
/* Index: PRUCAN_PRECAN_FK                                      */
/*==============================================================*/
create index PRUCAN_PRECAN_FK on PREGUNTACANDIDATO (
   CONSEPRUEBACANDI ASC
);

/*==============================================================*/
/* Table: PROCESOCANDIDATO                                      */
/*==============================================================*/
create table PROCESOCANDIDATO (
   USUARIO              VARCHAR2(30)          not null,
   CONSECREQUE          NUMBER(5,0)           not null,
   IDFASE               VARCHAR2(4)           not null,
   IDPERFIL             VARCHAR2(4)           not null,
   CONSPROCESO          NUMBER(5,0)           not null,
   FECHAPRESENTACION    DATE                  not null,
   ANALISIS             VARCHAR2(50),
   OBSERVACION          VARCHAR2(50),
   constraint PK_PROCESOCANDIDATO primary key (USUARIO, CONSECREQUE, IDFASE, IDPERFIL, CONSPROCESO)
);

/*==============================================================*/
/* Index: PROREQ_PROCAN_FK                                      */
/*==============================================================*/
create index PROREQ_PROCAN_FK on PROCESOCANDIDATO (
   CONSECREQUE ASC,
   IDFASE ASC,
   IDPERFIL ASC,
   CONSPROCESO ASC
);

/*==============================================================*/
/* Index: CAN_PROCAN_FK                                         */
/*==============================================================*/
create index CAN_PROCAN_FK on PROCESOCANDIDATO (
   USUARIO ASC
);

/*==============================================================*/
/* Table: PROCESOREQUERIMIENTO                                  */
/*==============================================================*/
create table PROCESOREQUERIMIENTO (
   CONSECREQUE          NUMBER(5,0)           not null,
   IDFASE               VARCHAR2(4)           not null,
   IDPERFIL             VARCHAR2(4)           not null,
   CONSPROCESO          NUMBER(5,0)           not null,
   CODEMPLEADO          VARCHAR2(5),
   FECHAINICIO          DATE,
   FECHAFIN             DATE,
   CONVOCATORIA         VARCHAR2(200),
   INVITACION           VARCHAR2(200),
   constraint PK_PROCESOREQUERIMIENTO primary key (CONSECREQUE, IDFASE, IDPERFIL, CONSPROCESO)
);

/*==============================================================*/
/* Index: PF_PR_FK                                              */
/*==============================================================*/
create index PF_PR_FK on PROCESOREQUERIMIENTO (
   IDFASE ASC,
   IDPERFIL ASC
);

/*==============================================================*/
/* Index: REQ_PROREQ_FK                                         */
/*==============================================================*/
create index REQ_PROREQ_FK on PROCESOREQUERIMIENTO (
   CONSECREQUE ASC
);

/*==============================================================*/
/* Index: EMP_PROREQ_FK                                         */
/*==============================================================*/
create index EMP_PROREQ_FK on PROCESOREQUERIMIENTO (
   CODEMPLEADO ASC
);

/*==============================================================*/
/* Table: PRUEBA                                                */
/*==============================================================*/
create table PRUEBA (
   IDPRUEBA             VARCHAR2(5)           not null,
   IDFASE               VARCHAR2(4)           not null,
   IDDISCIPLINA         VARCHAR2(4),
   IDTIPOPRUEBA         VARCHAR2(2)           not null,
   DESCPRUEBA           VARCHAR2(30)          not null,
   PRUEBAACTIVA         SMALLINT              not null,
   FECHACREADA          DATE,
   constraint PK_PRUEBA primary key (IDPRUEBA)
);

/*==============================================================*/
/* Index: FA_PRU_FK                                             */
/*==============================================================*/
create index FA_PRU_FK on PRUEBA (
   IDFASE ASC
);

/*==============================================================*/
/* Index: DIS_PRU_FK                                            */
/*==============================================================*/
create index DIS_PRU_FK on PRUEBA (
   IDDISCIPLINA ASC
);

/*==============================================================*/
/* Index: TIPOP_PRU_FK                                          */
/*==============================================================*/
create index TIPOP_PRU_FK on PRUEBA (
   IDTIPOPRUEBA ASC
);

/*==============================================================*/
/* Table: PRUEBACANDIDATO                                       */
/*==============================================================*/
create table PRUEBACANDIDATO (
   CONSEPRUEBACANDI     NUMBER(5,0)           not null,
   IDPRUEBA             VARCHAR2(5),
   USUARIO              VARCHAR2(30)          not null,
   CONSECREQUE          NUMBER(5,0)           not null,
   IDFASE               VARCHAR2(4)           not null,
   IDPERFIL             VARCHAR2(4)           not null,
   CONSPROCESO          NUMBER(5,0)           not null,
   FECHAPRES            DATE                  not null,
   CALIFICACION         NUMBER(3,1),
   constraint PK_PRUEBACANDIDATO primary key (CONSEPRUEBACANDI)
);

/*==============================================================*/
/* Index: PRUEBA_PRCAN_FK                                       */
/*==============================================================*/
create index PRUEBA_PRCAN_FK on PRUEBACANDIDATO (
   IDPRUEBA ASC
);

/*==============================================================*/
/* Index: PROCAN_PRUCAN_FK                                      */
/*==============================================================*/
create index PROCAN_PRUCAN_FK on PRUEBACANDIDATO (
   USUARIO ASC,
   CONSECREQUE ASC,
   IDFASE ASC,
   IDPERFIL ASC,
   CONSPROCESO ASC
);

/*==============================================================*/
/* Table: REQUERIMIENTO                                         */
/*==============================================================*/
create table REQUERIMIENTO (
   CONSECREQUE          NUMBER(5,0)           not null,
   CODEMPLEADO          VARCHAR2(5),
   EMP_CODEMPLEADO      VARCHAR2(5)           not null,
   FECHAREQUE           DATE                  not null,
   SALARIOMAX           NUMBER(6,0)           not null,
   SALARIOMIN           NUMBER(6,0),
   DESFUNCION           VARCHAR2(50)          not null,
   DESCARRERAS          VARCHAR2(50)          not null,
   NVVACANTES           NUMBER(2,0)           not null,
   constraint PK_REQUERIMIENTO primary key (CONSECREQUE)
);

/*==============================================================*/
/* Index: E_REQ_FK                                              */
/*==============================================================*/
create index E_REQ_FK on REQUERIMIENTO (
   CODEMPLEADO ASC
);

/*==============================================================*/
/* Index: E_REQUE_FK                                            */
/*==============================================================*/
create index E_REQUE_FK on REQUERIMIENTO (
   EMP_CODEMPLEADO ASC
);

/*==============================================================*/
/* Table: RESPUESTA                                             */
/*==============================================================*/
create table RESPUESTA (
   IDPRUEBA             VARCHAR2(5)           not null,
   CONSEPREGUNTA        NUMBER(5,0)           not null,
   CONSECRESPUESTA      NUMBER(3,0)           not null,
   RESPUESTA            VARCHAR2(30)          not null,
   constraint PK_RESPUESTA primary key (IDPRUEBA, CONSEPREGUNTA, CONSECRESPUESTA)
);

/*==============================================================*/
/* Index: P_R_FK                                                */
/*==============================================================*/
create index P_R_FK on RESPUESTA (
   IDPRUEBA ASC,
   CONSEPREGUNTA ASC
);

/*==============================================================*/
/* Table: RESPUESTACANDIDATO                                    */
/*==============================================================*/
create table RESPUESTACANDIDATO (
   CONSECRESCANDI       NUMBER(4,0)           not null,
   CONSEPRUEBACANDI     NUMBER(5,0),
   IDPRUEBA             VARCHAR2(5),
   CONSEPREGUNTA        NUMBER(5,0),
   RESCANDI             VARCHAR2(40)          not null,
   constraint PK_RESPUESTACANDIDATO primary key (CONSECRESCANDI)
);

/*==============================================================*/
/* Index: PC_RC_FK                                              */
/*==============================================================*/
create index PC_RC_FK on RESPUESTACANDIDATO (
   CONSEPRUEBACANDI ASC,
   IDPRUEBA ASC,
   CONSEPREGUNTA ASC
);

/*==============================================================*/
/* Table: TIPOCARGO                                             */
/*==============================================================*/
create table TIPOCARGO (
   IDTIPOCARGO          VARCHAR2(3)           not null,
   DESCTIPOCARGO        VARCHAR2(20)          not null,
   constraint PK_TIPOCARGO primary key (IDTIPOCARGO)
);

/*==============================================================*/
/* Table: TIPOCONTACTO                                          */
/*==============================================================*/
create table TIPOCONTACTO (
   IDTIPOCONTACTO       VARCHAR2(3)           not null,
   DESCTIPOCONTACTO     VARCHAR2(20)          not null,
   constraint PK_TIPOCONTACTO primary key (IDTIPOCONTACTO)
);

/*==============================================================*/
/* Table: TIPOCONTACTO2                                         */
/*==============================================================*/
create table TIPOCONTACTO2 (
   IDTIPOCONTACTO2      VARCHAR2(3)           not null,
   DESCTIPOCONTACTO     VARCHAR2(20)          not null,
   constraint PK_TIPOCONTACTO2 primary key (IDTIPOCONTACTO2)
);

/*==============================================================*/
/* Table: TIPODOC                                               */
/*==============================================================*/
create table TIPODOC (
   IDTIPODOC            VARCHAR2(3)           not null,
   DESCTIPODOC          VARCHAR2(20)          not null,
   constraint PK_TIPODOC primary key (IDTIPODOC)
);

/*==============================================================*/
/* Table: TIPOITEMPERFIL                                        */
/*==============================================================*/
create table TIPOITEMPERFIL (
   IDTIPOITEMPERFIL     VARCHAR2(4)           not null,
   DESCTIPOITEMPERFIL   VARCHAR2(30)          not null,
   constraint PK_TIPOITEMPERFIL primary key (IDTIPOITEMPERFIL)
);

/*==============================================================*/
/* Table: TIPOITEMPERFIL2                                       */
/*==============================================================*/
create table TIPOITEMPERFIL2 (
   IDTIPOITEMPERFIL4    VARCHAR2(4)           not null,
   DESCTIPOITEMPERFIL   VARCHAR2(30)          not null,
   constraint PK_TIPOITEMPERFIL2 primary key (IDTIPOITEMPERFIL4)
);

/*==============================================================*/
/* Table: TIPOPREGUNTA                                          */
/*==============================================================*/
create table TIPOPREGUNTA (
   IDTIPOPREGUNTA       VARCHAR2(4)           not null,
   DESCTIPOPREGUNTA     VARCHAR2(30)          not null,
   constraint PK_TIPOPREGUNTA primary key (IDTIPOPREGUNTA)
);

/*==============================================================*/
/* Table: TIPOPRUEBA                                            */
/*==============================================================*/
create table TIPOPRUEBA (
   IDTIPOPRUEBA         VARCHAR2(2)           not null,
   DESCTIPOPRUEBA       VARCHAR2(30)          not null,
   constraint PK_TIPOPRUEBA primary key (IDTIPOPRUEBA)
);

alter table CANDIDATO
   add constraint FK_CANDIDAT_DIS2_CAN_DISCIPLI foreign key (IDDISCIPLINA2)
      references DISCIPLINA2 (IDDISCIPLINA2);

alter table CANDIDATO
   add constraint FK_CANDIDAT_TIPODOC_C_TIPODOC foreign key (IDTIPODOC)
      references TIPODOC (IDTIPODOC);

alter table CARGO
   add constraint FK_CARGO_EMP_CAR_EMPLEADO foreign key (CODEMPLEADO)
      references EMPLEADO (CODEMPLEADO);

alter table CARGO
   add constraint FK_CARGO_TIPCA_CA_TIPOCARG foreign key (IDTIPOCARGO)
      references TIPOCARGO (IDTIPOCARGO);

alter table CONTACTOCANDIDATO
   add constraint FK_CONTACTO_CANT_CONT_CANDIDAT foreign key (USUARIO)
      references CANDIDATO (USUARIO);

alter table CONTACTOCANDIDATO
   add constraint FK_CONTACTO_TIPCON2_C_TIPOCONT foreign key (IDTIPOCONTACTO2)
      references TIPOCONTACTO2 (IDTIPOCONTACTO2);

alter table CONTACTOCLIENTE
   add constraint FK_CONTACTO_CLI_CONCL_CLIENTE foreign key (NIT)
      references CLIENTE (NIT);

alter table CONTACTOCLIENTE
   add constraint FK_CONTACTO_TCAR_CONC_TIPOCARG foreign key (IDTIPOCARGO)
      references TIPOCARGO (IDTIPOCARGO);

alter table CONTACTOCLIENTE
   add constraint FK_CONTACTO_TCON_CONC_TIPOCONT foreign key (IDTIPOCONTACTO)
      references TIPOCONTACTO (IDTIPOCONTACTO);

alter table DETALLEFACTURA
   add constraint FK_DETALLEF_FAC_DETFA_FACTURA foreign key (NFACTURA)
      references FACTURA (NFACTURA);

alter table FACTURA
   add constraint FK_FACTURA_CLI_FACT_CLIENTE foreign key (NIT)
      references CLIENTE (NIT);

alter table FACTURA
   add constraint FK_FACTURA_EMP_FAC_EMPLEADO foreign key (CODEMPLEADO)
      references EMPLEADO (CODEMPLEADO);

alter table FASECARGO
   add constraint FK_FASECARG_F_FCAR_FASE foreign key (IDFASE)
      references FASE (IDFASE);

alter table FASECARGO
   add constraint FK_FASECARG_TCAR_FCAR_TIPOCARG foreign key (IDTIPOCARGO)
      references TIPOCARGO (IDTIPOCARGO);

alter table HV
   add constraint FK_HV_CAN_HV_CANDIDAT foreign key (USUARIO)
      references CANDIDATO (USUARIO);

alter table HV
   add constraint FK_HV_INS_HV_INSTITUC foreign key (CODINSTITUCION)
      references INSTITUCION (CODINSTITUCION);

alter table HV
   add constraint FK_HV_TIPOITP2__TIPOITEM foreign key (IDTIPOITEMPERFIL4)
      references TIPOITEMPERFIL2 (IDTIPOITEMPERFIL4);

alter table ITEMPERFIL
   add constraint FK_ITEMPERF_PERF_ITEM_PERFIL foreign key (IDPERFIL)
      references PERFIL (IDPERFIL);

alter table ITEMPERFIL
   add constraint FK_ITEMPERF_TIPOIP_IP_TIPOITEM foreign key (IDTIPOITEMPERFIL)
      references TIPOITEMPERFIL (IDTIPOITEMPERFIL);

alter table PERFIL
   add constraint FK_PERFIL_DIS_PER_DISCIPLI foreign key (IDDISCIPLINA)
      references DISCIPLINA (IDDISCIPLINA);

alter table PERFILFASE
   add constraint FK_PERFILFA_F_PF_FASE foreign key (IDFASE)
      references FASE (IDFASE);

alter table PERFILFASE
   add constraint FK_PERFILFA_PER_PERFA_PERFIL foreign key (IDPERFIL)
      references PERFIL (IDPERFIL);

alter table PREGUNTA
   add constraint FK_PREGUNTA_PRUB_PREG_PRUEBA foreign key (IDPRUEBA)
      references PRUEBA (IDPRUEBA);

alter table PREGUNTA
   add constraint FK_PREGUNTA_TIPOP_P_TIPOPREG foreign key (IDTIPOPREGUNTA)
      references TIPOPREGUNTA (IDTIPOPREGUNTA);

alter table PREGUNTACANDIDATO
   add constraint FK_PREGUNTA_PRUCAN_PR_PRUEBACA foreign key (CONSEPRUEBACANDI)
      references PRUEBACANDIDATO (CONSEPRUEBACANDI);

alter table PREGUNTACANDIDATO
   add constraint FK_PREGUNTA_P_PC_PREGUNTA foreign key (IDPRUEBA, CONSEPREGUNTA)
      references PREGUNTA (IDPRUEBA, CONSEPREGUNTA);

alter table PROCESOCANDIDATO
   add constraint FK_PROCESOC_CAN_PROCA_CANDIDAT foreign key (USUARIO)
      references CANDIDATO (USUARIO);

alter table PROCESOCANDIDATO
   add constraint FK_PROCESOC_PROREQ_PR_PROCESOR foreign key (CONSECREQUE, IDFASE, IDPERFIL, CONSPROCESO)
      references PROCESOREQUERIMIENTO (CONSECREQUE, IDFASE, IDPERFIL, CONSPROCESO);

alter table PROCESOREQUERIMIENTO
   add constraint FK_PROCESOR_EMP_PRORE_EMPLEADO foreign key (CODEMPLEADO)
      references EMPLEADO (CODEMPLEADO);

alter table PROCESOREQUERIMIENTO
   add constraint FK_PROCESOR_PF_PR_PERFILFA foreign key (IDFASE, IDPERFIL)
      references PERFILFASE (IDFASE, IDPERFIL);

alter table PROCESOREQUERIMIENTO
   add constraint FK_PROCESOR_REQ_PRORE_REQUERIM foreign key (CONSECREQUE)
      references REQUERIMIENTO (CONSECREQUE);

alter table PRUEBA
   add constraint FK_PRUEBA_DIS_PRU_DISCIPLI foreign key (IDDISCIPLINA)
      references DISCIPLINA (IDDISCIPLINA);

alter table PRUEBA
   add constraint FK_PRUEBA_FA_PRU_FASE foreign key (IDFASE)
      references FASE (IDFASE);

alter table PRUEBA
   add constraint FK_PRUEBA_TIPOP_PRU_TIPOPRUE foreign key (IDTIPOPRUEBA)
      references TIPOPRUEBA (IDTIPOPRUEBA);

alter table PRUEBACANDIDATO
   add constraint FK_PRUEBACA_PROCAN_PR_PROCESOC foreign key (USUARIO, CONSECREQUE, IDFASE, IDPERFIL, CONSPROCESO)
      references PROCESOCANDIDATO (USUARIO, CONSECREQUE, IDFASE, IDPERFIL, CONSPROCESO);

alter table PRUEBACANDIDATO
   add constraint FK_PRUEBACA_PRUEBA_PR_PRUEBA foreign key (IDPRUEBA)
      references PRUEBA (IDPRUEBA);

alter table REQUERIMIENTO
   add constraint FK_REQUERIM_E_REQ_EMPLEADO foreign key (CODEMPLEADO)
      references EMPLEADO (CODEMPLEADO);

alter table REQUERIMIENTO
   add constraint FK_REQUERIM_E_REQUE_EMPLEADO foreign key (EMP_CODEMPLEADO)
      references EMPLEADO (CODEMPLEADO);

alter table RESPUESTA
   add constraint FK_RESPUEST_P_R_PREGUNTA foreign key (IDPRUEBA, CONSEPREGUNTA)
      references PREGUNTA (IDPRUEBA, CONSEPREGUNTA);

alter table RESPUESTACANDIDATO
   add constraint FK_RESPUEST_PC_RC_PREGUNTA foreign key (CONSEPRUEBACANDI, IDPRUEBA, CONSEPREGUNTA)
      references PREGUNTACANDIDATO (CONSEPRUEBACANDI, IDPRUEBA, CONSEPREGUNTA);