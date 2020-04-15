import Scenes
import Igis

/*
 This class is responsible for rendering the background.
 */


class Background : RenderableEntity {
    let text : Text
    let rectangle : Rectangle

    init() {
        text = Text(location:Point(x:50, y:50), text:"Hello, World!")
        text.font = "30pt Arial"

        let rect = Rect(topLeft:Point(x:20, y:10), size:Size(width:300, height:50))
        rectangle = Rectangle(rect:rect, fillMode:.stroke)
        
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.render(text, rectangle)
        
        canvas.render(drawRect(20, 80, 80, 200))

        for y in stride(from: 80, to: 280, by:50) {
            for x in stride(from: 120, to: 320, by:50) {
                canvas.render(drawRect(x, y, 50, 50))
            }
        }

        // brick: width: 60, height: 25

        // var isEven = false;
        var numBricksPerRow = 5
        for y in stride(from:80, to:280, by:50) {
            var x = 340
            for _ in 1...numBricksPerRow {
                canvas.render(drawRect(x, y, 60, 25))
                x += 60                
            }
        }
        numBricksPerRow = 6
        for y in stride(from:105, to: 280, by:50) {
            var x = 340
            for num in 1...numBricksPerRow {
                if(num == 1 || num == numBricksPerRow) {
                    canvas.render(drawRect(x, y, 30, 25))
                    x += 30
                } else {
                    canvas.render(drawRect(x, y, 60, 25))
                    x += 60
                }
            }
        }

           
        canvas.render(write(50, 325, "1"))
        canvas.render(write(205, 325, "2"))
        canvas.render(write(475, 325, "3"))


        var bricks = 15
        let rows = bricks
        let w = 50
        let h = 25
        var x = 20
        var y = 800
        var initX = x
        let initY = y
        
        for _ in 1...rows {
            x = initX
            for _ in 1...bricks {
                canvas.render(drawRect(x, y, w, h))
                x += w
            }
            y -= h
            initX += w / 2
            bricks -= 1
        }

        canvas.render(write((rows / 2) * w + 30, initY + 70, "4"))



        canvas.render(drawRect(900, 600, 150, 3000))
        canvas.render(drawRect(965, 540, 20, 60))
        canvas.render(write(915, 520, "Akshat"))
        canvas.render(drawRect(905, 470, 140, 70))

        var h1 : Int = 0
        var h2 : Int = 0
        var h3 : Int = 0

        while(h1 == h2 || h1 == h3 || h2 == h3) {
            h1 = Int.random(in: 300...500)
            h2 = Int.random(in: 300...500)
            h3 = Int.random(in: 300...500)
        }
        let arr = [h1, h2, h3]
        x = 1350
        for height in arr {
            canvas.render(drawRect(x, height, 200, 3000))
            canvas.render(writeName(x+42, 1280, 12))
            x += 300
        }

        canvas.render(write(1400, 50, "I dare you to refresh the page a couple of times..."))
        
    }

    func drawRect(_ x:Int, _ y:Int, _ width:Int, _ height:Int) -> Rectangle {
        let rect = Rect(topLeft:Point(x:x, y:y), size:Size(width:width, height:height))
        return Rectangle(rect:rect, fillMode:.stroke)
    }

    func write(_ x:Int, _ y:Int, _ text:String) -> Text {
        return Text(location:Point(x:x, y:y), text:text)
    }

    func writeName(_ x:Int, _ y:Int, _ fontSize:Int) -> Text {
        let text = Text(location:Point(x:x, y:y), text:"Akshat Shah")
        text.font = String(fontSize) + "pt Arial"
        return text
    }
}
