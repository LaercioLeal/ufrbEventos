const connection = require('./connection');

module.exports = {

    async createTable(){
        connection.query('CREATE TABLE IF NOT EXISTS summary (' +
            ' id serial PRIMARY KEY, ' +
            ' inscriptionId integer NOT NULL, ' +
            ' enrollment varchar(255) NOT NULL, ' +
            ' userInstitution varchar(255), ' +
            ' title varchar(255) NOT NULL, ' +
            ' description varchar(255), ' +
            ' summaryDocument varchar(255) NOT NULL, ' +
            ' video varchar(255), ' +
            ' approvement boolean NOT NULL )',
            (err) => {
                if(err){
                    console.log("Não foi possível criar tabela SUMMARY!\n", err.stack);
                }
            }
        );
    },

    async createSummary(inscriptionId, enrollment, userInstitution, title, description, summary, video){

        const query = {
            text: 'INSERT INTO summary( inscriptionId, enrollment, userInstitution, title, ' +
                ' description, summaryDocument, video, approvement ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8)',
            values: [inscriptionId, enrollment, userInstitution, title, description, summary, video, 'false']
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

    }
};