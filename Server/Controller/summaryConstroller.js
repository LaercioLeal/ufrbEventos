const Summary = require('../Model/summary');
const Inscription = require('../Model/inscription');

module.exports = {

    async createSummary(req, res) {

        let { inscriptionId, enrollment, userInstitution, title, description, summary, video } = req.body;

        if (!isNaN(inscriptionId)) {

            let inscription = await Inscription.inscriptionConsultantById(inscriptionId);
            console.log("INSCRIPTION RESULT: ", inscription);

            if (inscription == true) {

                if (enrollment == '' || title == '' || summary == '') {
                    res.json({ response: 'false', observation: 'Dados em branco' });
                }
                else {
                    let create = Summary.createSummary(inscriptionId, enrollment, userInstitution, title, description, summary, video);

                    if (create) {
                        console.log("Resumo adicionado com sucesso!\n");
                        res.json({ response: 'true' });
                    }
                    else {
                        console.log("Não foi possível realizar o cadastro.\n", create.error, create.validation);
                        res.json({ response: create.validation, observation: create.error });
                    }
                }
            }
            else {
                console.log("Inscrição não encontrada.");
                res.json({ response: 'false', observation: 'Não inscrito' });
            }

        }
        else {
            res.json({ response: 'false', observation: 'Inscrição IsNaN' });
        }

    }

};