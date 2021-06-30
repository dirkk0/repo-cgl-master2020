
const http = require("http")
const express = require("express")

let app = express()

// let server = http.createServer(function (req, res) {
//     res.end('hello world', req.url)
//     console.log(req.url)
// })

let database = ["han solo", "princess leia", "chewbacas"]

let infomessage = "abc"


app.get('/api/:id', function (req, res) {
    // console.log(req.params)
    // res.end(JSON.stringify(req.params.id))
    res.end(database[req.params.id])
})

app.get('/setmsg/:txt', function (req, res) {
    infomessage = req.params.txt
    res.end("txt: " + infomessage)
})

app.get('/getmsg', function (req, res) {
    res.end("display: " + infomessage)
})



app.use('/', express.static(__dirname + '/../public'))

let server = http.createServer(app)

const PORT=5000

server.listen(PORT)

// console.log("server running on port: "+PORT)
console.log(`server running on port: ${PORT}`)