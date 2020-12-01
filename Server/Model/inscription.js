const connection = require('./connection');

module.exports = {

    async createTable() {
        connection.query('CREATE TABLE IF NOT EXISTS inscription (' +
            ' id serial PRIMARY KEY, ' +
            ' userCPF integer NOT NULL, ' +
            ' eventId integer NOT NULL, ' +
            ' saleId integer UNIQUE, ' +
            ' userInstitution varchar(255), ' +
            ' category varchar(255) NOT NULL, ' +
            ' participation varchar(255) NOT NULL, ' +
            ' phone varchar(255), ' +
            ' attendance integer, ' +
            ' userWorkload float)',
            (err) => {
                if (err) {
                    console.log("Não foi possível criar tabela INSCRIPTION!\n", err.stack);
                }
            }
        );
    },

    async createInscription(usercpf, eventid, saleid, userinstitution, category,
            participation, phone, attendance, userworkload) {

        let query = {
            text: 'INSERT INTO inscription( usercpf, eventid, saleid, userinstitution, category, ' +
                ' participation, phone, attendance, userworkload) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)',
            values: [usercpf, eventid, saleid, userinstitution, category, participation,
                phone, attendance, userworkload]
        }

        connection.query(query, (err) => {
            if (err) {
                let res = {
                    validation: 'false',
                    error: err.stack
                }
                return res;
            }
            else {
                return true;
            }
        });

    },

    inscriptionConsultant(inscriptionId){

        let validate = 0;
        let query = {
            text: "SELECT id FROM inscription WHERE id = $1",
            values: [inscriptionId]
        }
        
        connection.query(query, (err, res) => {
                   
            if (res.rows[0] != undefined) {    
                validate = true;
            }

        });
        
        if(validate){
            return true;
        }
        else{
            return false;
        }
    }
    

};