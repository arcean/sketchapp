import QtQuick 1.0
import Canvas 1.0

Canvas {
    id:canvas
    color: "white"
    property int paintX
    property int paintY
    property int begin_paintX
    property int begin_paintY
    property int last_paintX
    property int last_paintY
    property int count: 0
    property int lineWidth: 2
    property variant drawColor: "black"
    property variant ctx: getContext("2d");

    MouseArea {
        id:mousearea
        hoverEnabled:true
        anchors.fill: parent
        onClicked: drawPoint();
        onReleased: {
            resetMouse();
        }
        onPressed: {
            last_paintX = begin_paintX;
            last_paintY = begin_paintY;
            begin_paintX = mouseX;
            begin_paintY = mouseY;
        }

        onPositionChanged:  {
            if (mousearea.pressed)
                drawLineSegment();
            paintX = mouseX;
            paintY = mouseY;
        }
    }

    function strokeRect() {
        ctx.strokeStyle = drawColor
        ctx.lineWidth = lineWidth
        ctx.strokeRect(begin_paintX, begin_paintY, paintX, paintY);
        //clear last rectangle
        clearLastRect();
    }

    function clearLastRect() {
        ctx.strokeStyle = "white"
        ctx.lineWidth = lineWidth
        ctx.clearRect(begin_paintX, begin_paintY, last_paintX, last_paintY);
    }

    function resetMouse() {
        begin_paintX = -1;
        begin_paintY = -1;
    }

    function drawLineSegment() {
        ctx.beginPath();
        ctx.strokeStyle = drawColor
        ctx.lineWidth = lineWidth
        ctx.moveTo(paintX, paintY);
        ctx.lineTo(mousearea.mouseX, mousearea.mouseY);
        ctx.stroke();
        ctx.closePath();
    }

    function drawPoint() {
        ctx.lineWidth = lineWidth
        ctx.fillStyle = drawColor
        ctx.fillRect(mousearea.mouseX, mousearea.mouseY, 2, 2);
    }

    function clear() {
        ctx.clearRect(0, 0, width, height);
    }
}
