const http = require("http");
const express = require('express');
const logEvent = require('./events/myEmitter.js');
const loggingListener = require('./events/logging.listener');
const appMiddleware = require('./middlewares/app-middlewares');
const appRoutes = require('./routes/index.route');

loggingListener();
const app = express();
app.use(appMiddleware);
app.use(appRoutes);
const server = http.createServer(app);
server.on('error', function (e) {
    logEvent.emit('APP-ERROR', {
        logTitle: 'APP-FAILED',
        logMessage: e
    });
});
module.exports = server;