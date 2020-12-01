const summary = require('./summary');
const inscription = require('./inscription');

module.exports = {
    
    async create(){
        await summary.createTable();
        await inscription.createTable();
    }

}