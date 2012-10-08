import QtQuick 1.1
import com.nokia.meego 1.0

PageStackWindow {
    id: appWindow

    initialPage: mainPage

    // Base:
    property string __APP_NAME: "!!Sketch"
    property string __APP_VERSION: "0.0.1"
    // Theme:
    property string __TEXT_COLOR: theme.inverted ? "white" : "black"
    property string __ACTIVE_COLOR: "color2"
    property string __ACTIVE_COLOR_TEXT: "#6FBD15"
    property string __DISABLED_COLOR_TEXT: "#797979"
    // Font size:
    property int __SMALL_FONT_SIZE: 18
    property int __STANDARD_FONT_SIZE: 24
    property int __HEADER_FONT_SIZE: 32
    property int __LARGE_FONT_SIZE: 40
    // Margins:
    property int __MARGIN: 16

    MainPage {
        id: mainPage
    }

    ToolBarLayout {
        id: commonTools
        visible: true
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
            MenuItem { text: qsTr("Line 1") }
            MenuItem { text: qsTr("Line 2") }
            MenuItem { text: qsTr("Line 3") }
        }
    }
}
