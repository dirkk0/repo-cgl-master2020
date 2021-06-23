
function SpeechObj() {

    this.direction = null;  // 1 left, 2: right: 3: up, 4: down
    this.move = false

    this.init = function () {
        console.log("annyang initialized!")
    }

    
    // this.setStart = function () {
    //     this.move = 1
    // }
    
    // this.setStop = function () {
    //     this.move = 0
    // }

    this.setLeft = function () {
        this.direction = 1
        setTimeout(() => {
            this.direction = null
        }, 100);
    }
    this.setRight = function () {
        this.direction = 2
    }
    this.setUp = function () {
        // this.direction = 3
        this.move = true
    }
    this.goLeft = function () {
        if (this.direction == 1) return true
    }
    this.goRight = function () {
        if (this.direction == 2) return true
    }
    this.goUp = function () {
        if (this.direction == 3) return true
    }
}


let speechObj = new SpeechObj()
