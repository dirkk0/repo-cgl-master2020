
const http = require("http")
const express = require("express")

let app = express()

// let server = http.createServer(function (req, res) {
//     res.end('hello world', req.url)
//     console.log(req.url)
// })

let database = ["han solo", "princess leia", "chewbaca"]

app.get('/api/:id', function (req, res) {
    // console.log(req.params)
    // res.end(JSON.stringify(req.params.id))
    res.end(database[req.params.id])
})

app.use('/', express.static(__dirname + '/../public'))

let server = http.createServer(app)

server.listen(9000)
