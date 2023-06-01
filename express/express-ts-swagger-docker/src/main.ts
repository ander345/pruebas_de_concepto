import * as express from 'express';
import * as fs from 'fs';
import * as https from 'https';
import { RegisterRoutes } from './routes/routes';  // here

///usr/src/app/src/cert
//const privateKey = fs.readFileSync('./src/cert/key.pem');
//const certificate = fs.readFileSync('./src/cert/cert.pem');
const privateKey = fs.readFileSync('./src/cert/localhost.key');
const certificate = fs.readFileSync('./src/cert/localhost.crt');
const credentials = {key: privateKey, cert: certificate};

const app = express();
const port = 3000;


app.use(function (req, res, next) {

    // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', 'http://localhost:8888');

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);

    // Pass to next layer of middleware
    next();
});

RegisterRoutes(app);  // and here

//app.listen(port, () => console.log(`Server started listening to port ${port}`));

const httpsServer = https.createServer(credentials, app);

httpsServer.listen(port, () => console.log(`Server started listening to port ${port}`));
