
function SpeechObj() {

    this.direction = null;  // 1 left, 2: right: 3: up, 4: down
    this.move = false

    this.init = function () {
        console.log("annyang initialized!")
    }
    
    this.setUp = function () {
        this.move = true
    }
    this.setDown = function () {
        this.move = false
    }
    
    this.setLeft = function () {
        this.direction = 1
        setTimeout(() => {
            this.direction = null
        }, 300);
    }
    this.setRight = function () {
        this.direction = 2
        setTimeout(() => {
            this.direction = null
        }, 300);
    }

    this.isLeft = function () {
        if (this.direction == 1) return true
    }
    this.isRight = function () {
        if (this.direction == 2) return true
    }
    this.isUp = function () {
        // if (this.move == true) return true
        return this.move
    }
    this.isDown = function () {
        // if (this.move == true) return true
        return !this.move
    }
}


let speechObj = new SpeechObj()


if (annyang) {
    // Let's define our first command. First the text we expect, and then the function it should call
    let commands = {
      'test': function () {
        console.log("yay")
        // $('#tpsreport').animate({bottom: '-100px'});
      },
      'up': function () {
        console.log("ship going up")
        speechObj.setUp()
      },
      'down': function () {
        console.log("ship going down")
        speechObj.setDown()
      },
      'left': function () {
        console.log("ship going left")
        speechObj.setLeft()
      },
      'right': function () {
        console.log("ship going right")
        speechObj.setRight()
      },

    };

    // Add our commands to annyang
    annyang.addCommands(commands);
    annyang.setLanguage("en-US");

    // Start listening. You can call this here, or attach this call to an event, button, etc.
    annyang.start();

    annyang.addCallback("resultMatch", function (
      userSaid, commandText, phrases) {
      // console.log(userSaid)
      // console.log(commandText)
      // console.log(phrases)
    })

    annyang.addCallback("resulNoMatch", function (err) {
      console.log(err)
    })

  }