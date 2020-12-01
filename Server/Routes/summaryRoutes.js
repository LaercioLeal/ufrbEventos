const Express = require('express');
const route = Express();
const controller = require('../Controller/summaryConstroller');

route.post("/createsummary", controller.createSummary);

module.exports = route;