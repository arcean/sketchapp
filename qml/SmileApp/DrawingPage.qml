import QtQuick 1.1
import com.nokia.meego 1.0
import Canvas 1.0

Page {

    tools: ToolBarLayout {
        ToolIcon {
            platformIconId: "toolbar-back"
            onClicked: appWindow.pageStack.pop()
        }
    }

    Rectangle {
        id:root
        anchors.fill: parent
        color:"#333"

        Rectangle {
            id: canvasContainer
            anchors.fill: parent
            anchors.margins: 8
            color:"#222"

            Drawing {
                id:canvas
                width:parent.width
                height:parent.height
                anchors.margins:-2
                x:-3
                y:-3
            }
        }

        FocusScope {
            id: colorpicker
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.margins: 8
            width:200
            height:22
            focus:true
            Row {
                id:row
                anchors.fill: parent
                spacing: 8
                Repeater {
                    model: ["black","firebrick", "orange", "gold", "purple", "steelblue", "seagreen"]
                    ColorButton { color: modelData }
                }
            }
        }
    }
}
