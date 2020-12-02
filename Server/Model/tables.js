const summary = require('./summary');
const inscription = require('./inscription');

module.exports = {
    
    async create(){
        await summary.createTable();
        await inscription.createTable();
        inscription.createInscription(23, 65, 2, "teste3", "testaCategory3", "das as213 fdsd", "5453");
        inscription.createInscription(34, 3, 65, "teste4", "testaCategory4", "qwe we ew q dasawesd", "234284032");
        inscription.createInscription(1, 1, 777, "teste5", "testaCategory5", "re e re rqwe wqeweq", "5454032");
        inscription.createInscription(345, 23, 231, "teste6", "testaCategory6", "da sas  wqewq d", "435432");
        inscription.createInscription(123, 544, 6554, "teste7", "testaCategory7", "das wqeas wed", "234032");
    }
            

}