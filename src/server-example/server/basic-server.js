
const http = require("http")
const express = require("express")

let app = express()

// let server = http.createServer(function (req, res) {
//     res.end('hello world', req.url)
//     console.log(req.url)
// })

let database = ["han solo", "princess leia", "chewbaca"]

// app.get('/api/:id', function (req, res) {
//     // console.log(req.params)
//     // res.end(JSON.stringify(req.params.id))
//     res.end(database[req.params.id])
// })

app.get('/api/:id', function (req, res) {
    console.log(req.params)
    // res.end(JSON.stringify(req.params.id))
    let i = parseInt(req.params.id)
    let result = database[i]
    console.log(result)
    res.end(result)  // sending!!
})

// app.get('/api/:id/test/:id2', function (req, res) {
//     console.log(req.params)
//     let a = +parseInt(req.params.id2) + parseInt(req.params.id)
//     res.end(JSON.stringify(a))
//     // res.end(database[req.params.id])
// })

app.use('/', express.static(__dirname + '/../public'))  // static webserver

let server = http.createServer(app)

const PORT=5001

server.listen(PORT)  // endless loop

// console.log("server running on port: "+PORT)
console.log(`server running on port: ${PORT}`)