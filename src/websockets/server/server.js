
const http = require("http")   // this does basic http protocoll
const express = require('express')  // this does fancy web stuff

const app = express() // defines the web app

// first install
// npm install socket.io
const socketio = require('socket.io');

const server = http.createServer(app) // create the server

app.use('/', express.static(__dirname + '/../public'));
console.log(__dirname + '/public');

const PORT=5000 // this defines the port

console.log("server started on port", PORT)

server.listen(PORT) // this start the actual server

const io = socketio(server);

io.on('connection', (socket) => {
    console.log("connection established")

    // setTimeout(() => {
    //     io.emit('chat', 456);
    // }, 1000);


    socket.on('client_chat', (msg) => {
        // console.log('position: ' + JSON.stringify(msg));
        console.log(msg)
        io.emit('chat', msg);

    });
    socket.on('client_pos', (msg) => {
        // console.log('position: ' + JSON.stringify(msg));
        console.log(msg)
        msg.id = socket.id
        io.emit('pos', msg);

    });
    socket.on('disconnect', (c) => {
        console.log(socket.id)
        io.emit('exit', socket.id);
    });
})


