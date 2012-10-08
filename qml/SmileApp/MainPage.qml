import QtQuick 1.1
import com.nokia.meego 1.0
import "Utils.js" as Utils
import "Components"

Page {
    tools: commonTools

    PageHeader {
        id: header

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        title: __APP_NAME
    }

    Rectangle {
        id: container

        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: __MARGIN

        color: "lightblue"

        Rectangle {
            id: newButton
            height: 40
            width: 100

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: __MARGIN

            color: "blue"

            Label {
                anchors.centerIn: parent
                text: "!!New"
            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    createNew();
                }
            }
        }
    }

    function createNew()
    {
        var newPage = Utils.createObject(Qt.resolvedUrl("DrawingPage.qml"), appWindow.pageStack);
        appWindow.pageStack.push(newPage);
    }
}
