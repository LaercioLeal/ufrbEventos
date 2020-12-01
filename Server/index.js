const express = require("express");
const app = express();
const bodyParser = require("body-parser");

const connection = require("./Model/connection");
const createDB = require("./Model/createDB");

const summary = require("./Routes/summaryRoutes");
const table = require('./Model/summary');

//Database Connection
async function dbConnection(){

    try {
        await connection.connect();
        console.log("Conexão realizada com sucesso!");
        table.createTable();
    } catch (error) {
        await connection.end(); //Encerra client
        console.log("Banco de dados não encontrado. Tentando criar nova database...\n");
        await createDB.connect();
    }
    
}

//Body-Parser
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use("/summary", summary);

app.listen(3500, () => {
    console.log("Servidor online! Porta 3500.");
    console.log("Iniciando PostgreSQL.");
    dbConnection();
});