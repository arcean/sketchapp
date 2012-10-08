import QtQuick 1.1
import com.nokia.meego 1.0
import "../"

Dialog {
    id: dialog
    anchors.centerIn: parent
    title: [
        Item {
            height: dialog.platformStyle.titleBarHeight
            width: parent.width
            Label {
                anchors.left: parent.left
                font.capitalization: Font.MixedCase
                color: "white"
                text: "Pick a color"
            }
        }
    ]
    content: [
        Item {
            anchors.centerIn: parent
            height: 200
            width: 300

            Grid {
                    id: colorPicker
                    rows: 2; columns: 7; spacing: 20

                Repeater {
                    model: ["black","firebrick", "orange", "gold", "purple", "steelblue", "seagreen", "white","grey", "yellow", "pink", "cyan", "magenta", "lightgreen"]
                    ColorButton {
                        color: modelData
                        onClicked: dialog.accept()
                    }
                }
            }

        }
    ]
    /*
    buttons: ButtonRow {
        platformStyle: ButtonStyle { }
        anchors.horizontalCenter: parent.horizontalCenter
        Button {id: b1; text: "Select"; onClicked: dialog.accept()}
        Button {id: b2; text: "Cancel"; onClicked: dialog.reject()}
    }*/
}
