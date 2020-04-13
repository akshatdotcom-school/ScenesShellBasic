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
    }
}
