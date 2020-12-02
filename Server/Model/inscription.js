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
        participation, phone) {

        /*Adiciona inscrições no banco.
         *Caso a inscrição seja bem sucedida retorna TRUE senão retorna FALSE.*/

        let validate = false;

        validate = await this.inscriptionConsultantByEventUser(usercpf, eventid);

        if (validate == false) {

            let query = {
                text: 'INSERT INTO inscription( usercpf, eventid, saleid, userinstitution, category, ' +
                    ' participation, phone, attendance, userworkload) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9)',
                values: [usercpf, eventid, saleid, userinstitution, category, participation,
                    phone, 0, 0]
            }

            validate = await connection.query(query)
                .then((res) => {
                    return true;
                })
                .catch(err => {
                    console.log("Não foi possível realizar inscrição. Erro:\n", err);
                    return false;
                });
                
            return validate;

        }
        else {
            return false;
        }
    },

    async inscriptionConsultantById(inscriptionId) {

        /*Consulta inscrições no banco por ID de INSCRIÇÕES.
         *Caso encontrada retorna TRUE senão retorna FALSE.*/

        let query = {
            text: "SELECT id FROM inscription WHERE id = $1",
            values: [inscriptionId]
        }

        let validate = false;

        validate = await connection.query(query)
            .then(res => {

                if (res.rows[0] != undefined) {
                    return true;
                }
                
                return false;

            })
            .catch(error => {
                console.log("Erro durante consulta:\n", error);
            });

        return validate;

    },

    async inscriptionConsultantByEventUser(usercpf, eventid) {

        /*Consulta inscrições no banco por CPF do USUÁRIO e ID do evento.
         *Caso encontrada retorna TRUE senão retorna FALSE.*/

        let validate = false;

        let query = {
            text: "SELECT (usercpf, eventid) FROM inscription WHERE (usercpf = $1 AND eventid = $2)",
            values: [usercpf, eventid]
        }

        validate = await connection.query(query)
            .then(res => {
                if (res.rows[0] != undefined) {
                    return true;
                }
                return false;

            })
            .catch(error => {
                console.log("Erro durante consulta:\n", error);
            });

        return validate;

    }

};