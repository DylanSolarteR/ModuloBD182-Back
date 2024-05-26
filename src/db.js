import oracleDB from "oracledb";

// Resultados de las consultas SQL como objetos
oracleDB.outFormat = oracleDB.OUT_FORMAT_OBJECT;

export async function connectDB() {
    try {
        await oracleDB.createPool({
            user: "master",
            password: "master",
            connectString: "localhost:1521/XE",
            poolAlias: "myPool",
            poolMax: 999
        })
    } catch (error) {
        console.log(error)
    }
}