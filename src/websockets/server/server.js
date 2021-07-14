
const http = require("http")   // this does basic http protocoll
const express = require('express')  // this does fancy web stuff


const app = express() // defines the web app

const server = http.createServer(app)

// let app = express()

// this creates a server instance
// let server = http.createServer(function (req, res) {
//     res.end('hello world', req.url) // this returns a message as a result
//     console.log(req.url)
// })

app.use('/', express.static(__dirname + '/../public'));
console.log(__dirname + '/public')

const PORT=5000 // this defines the port

console.log("server started on port", PORT)

server.listen(PORT) // this start the actual server
