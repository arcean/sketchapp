import QtQuick 1.1
import com.nokia.meego 1.0
import Canvas 1.0
import QCanvas 1.0

Page {

    tools: commonTools

    orientationLock: PageOrientation.LockLandscape

    QCanvas{

    }


    Rectangle {
        color:"#222"
        anchors.fill: parent

        Drawing {
            id:canvas
            width:parent.width
            height:parent.height
            anchors.margins:-2
            x:-3
            y:-3
        }
    }
}
