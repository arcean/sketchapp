import QtQuick 1.1
import com.nokia.meego 1.0
import "ColorPickerItems"
import "../"

CommonDialog {
    id: dialog
    anchors.centerIn: parent

    property string color: "#000000"

    property Style platformStyle: SelectionDialogStyle {}
    titleText: "Pick a color"

    content: [
        Item {
            anchors.centerIn: parent
            height: colorPicker.height
            width: colorPicker.width

            FocusScope {
                id: colorpicker
                anchors.fill: parent
                anchors.topMargin: 16
                focus: true

                Grid {
                    id: colorPicker
                    rows: 6
                    columns: 5
                    spacing: 6

                    Repeater {
                        model: ["#99FF66", "#66FF33", "#33CC00", "#009900", "#006600",
                            "#99CCFF", "#6699FF", "#3366FF", "#0033FF", "#0000CC",
                            "#FF99FF", "#FF66FF", "#CD33FF", "#9900CC", "#660099",
                            "#FF9999", "#FF6666", "#FF3333", "#CC0000", "#990000",
                            "#FFFF66", "#FFFF00", "#FFCC00", "#FF9900", "#FF6600",
                            "#CCCCCC", "#999999", "#666666", "#333333", "#000000"
                        ]
                        ColorPickerButton {
                            color: modelData
                            height: appWindow.inPortrait ? 80 : 56
                            onClicked: {
                                dialog.color = color;
                                dialog.accept()
                            }
                        }
                    }
                }
            }
        }
    ]
}
