const chai = require('chai');
const chaiHttp = require('chai-http');
const expect = chai.expect;
const server = require('../index');

chai.use(chaiHttp);
chai.use(require('chai-things'));

describe('Submetendo Resumo:\n', () => {

    const body = {
        inscriptionId: 1, enrollment: "2321", userInstitution: "userInstitution",
        title: "title", description: "description", summary: "summary", video: "video"
    };

    it('int ID Inscrição: ' + body.inscriptionId, (done) => {
        chai.request(server).post('/summary/createsummary').type('form')
            .send(body)
            .end((err, res) => {
                expect(res.body).to.includes({ response: "true" });
                done();
            });
    });
});

describe('', () => {
    const body2 = {
        inscriptionId: 764, enrollment: "2321", userInstitution: "userInstitution",
        title: "title", description: "description", summary: "summary", video: "video"
    };
    it('int ID Inscrição: ' + body2.inscriptionId, (done) => {
        chai.request(server).post('/summary/createsummary')
            .send(body2)
            .end((err, res) => {
                expect(res.body).to.includes({ response: "false" });
                done();
            });
    });
});

describe('', () => {
    const body3 = {
        inscriptionId: "1523", enrollment: "2321", userInstitution: "userInstitution",
        title: "title", description: "description", summary: "summary", video: "video"
    };
    it('string ID Inscrição: ' + body3.inscriptionId, (done) => {
        chai.request(server).post('/summary/createsummary')
            .send(body3)
            .end((err, res) => {
                expect(res.body).to.includes({ response: "false" });
                done();
            });
    });
});

describe('', () => {
    const body4 = {
        inscriptionId: "3", enrollment: "", userInstitution: "userInstitution",
        title: "title", description: "description", summary: "summary", video: "video"
    };
    it('string ID Inscrição: ' + body4.inscriptionId, (done) => {
        chai.request(server).post('/summary/createsummary')
            .send(body4)
            .end((err, res) => {
                expect(res.body).to.includes({ response: "false" });
                done();
            });
    });
});

describe('', () => {
    const body5 = {
        inscriptionId: "test", enrollment: "2321", userInstitution: "userInstitution",
        title: "title", description: "description", summary: "summary", video: "video"
    };
    it('string ID Inscrição: ' + body5.inscriptionId, (done) => {
        chai.request(server).post('/summary/createsummary')
            .send(body5)
            .end((err, res) => {
                expect(res.body).to.includes({ response: "false" });
                done();
            });
    });
});

describe('', () => {
    const body6 = {
        inscriptionId: "22", enrollment: "", userInstitution: "userInstitution",
        title: "title", description: "description", summary: "summary", video: "video"
    };
    it('string ID Inscrição: ' + body6.inscriptionId, (done) => {
        chai.request(server).post('/summary/createsummary')
            .send(body6)
            .end((err, res) => {
                expect(res.body).to.includes({ response: "false" });
                done();
            });
    });
});

describe('', () => {
    const body7 = {
        inscriptionId: null, enrollment: "2321", userInstitution: "userInstitution",
        title: "title", description: "description", summary: "summary", video: "video"
    };
    it('ID Inscrição: ' + body7.inscriptionId, (done) => {
        chai.request(server).post('/summary/createsummary')
            .send(body7)
            .end((err, res) => {
                expect(res.body).to.includes({ response: "false" });
                done();
            });
    });
});

describe('', () => {
    const body8 = {
        inscriptionId: undefined, enrollment: "2321", userInstitution: "userInstitution",
        title: "title", description: "description", summary: "summary", video: "video"
    };
    it('ID Inscrição: ' + body8.inscriptionId, (done) => {
        chai.request(server).post('/summary/createsummary')
            .send(body8)
            .end((err, res) => {
                expect(res.body).to.includes({ response: "false" });
                done();
            });
    });

});
