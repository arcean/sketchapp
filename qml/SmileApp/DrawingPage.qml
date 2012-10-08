import QtQuick 1.1
import com.nokia.meego 1.0
import Canvas 1.0
import "Components"

Page {

    tools: commonTools

    ToolBarLayout {
        id: commonTools
        visible: true

        ToolIcon {
            platformIconId: "toolbar-back"
            onClicked: appWindow.pageStack.pop()
        }
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status == DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }
    }

    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem {
                text: qsTr("Color picker")
                onClicked: colorPicker.open();
            }
        }
    }

    ColorPicker {
        id: colorPicker
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
