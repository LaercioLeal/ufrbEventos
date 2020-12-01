const { Client } = require('pg');

const client = new Client({
    user: 'postgres',
    password: '123456',
    host: 'localhost'
});

client.query('CREATE DATABASE ufrbeventos', (err, res) => {
    if (err) {
        console.log("Não foi possível criar nova database!", err.stack);
    } else {
        console.log("Banco de dados criado com sucesso!"); 
    }
});

module.exports = client;