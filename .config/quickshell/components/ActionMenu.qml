import Quickshell
import QtQuick

import '../core/'

PopupWindow {
    id: actionWindow
    property int menuHeight;
    property int menuWidth;
    property int menuRadius;

    property int menuBorderWidth: 0;

    property bool hasHoveredOver: false;
    property bool cursorOff: false;

    implicitHeight: menuHeight
    implicitWidth: menuWidth

    color: "transparent"
    visible: actionWindow.initialVisible

    Rectangle {
        id: actionBackground
        height: actionWindow.height;
        width: actionWindow.width;
        radius: menuRadius
        border.width: actionWindow.menuBorderWidth

        color: Colorscheme.bg
    }

}
