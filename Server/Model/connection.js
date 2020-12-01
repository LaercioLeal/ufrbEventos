const { Client } = require('pg');

const client = new Client({
    user: 'postgres',
    password: '123456',
    host: 'localhost',
    database: 'ufrbeventos'
});

module.exports = client;