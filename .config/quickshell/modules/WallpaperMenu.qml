import Quickshell
import QtQuick
import '../core'
import '../components/'

Item {
    id: wallpaperMenu
    property PanelWindow bar
    property BarConfig config
    
    WallpaperService { id: wallService }

    implicitWidth: menuButton.width
    implicitHeight: menuButton.height
    anchors.margins: config.moduleMargin

    ButtonModule {
        id: menuButton
        config: wallpaperMenu.config
        buttonHeight: config.moduleHeight
        buttonWidth: config.wallpaperIconWidth
        buttonBorderWidth: 10
        imagePath: wallService.currentWall

        onClicked: {
            if (!actionMenu.visible) wallService.listProc.running = true;
            actionMenu.visible = !actionMenu.visible;
        }
    }

    ActionMenu {
        id: actionMenu
        anchor.window: bar
        menuHeight: config.wallpaperMenuHeight
        menuWidth: config.wallpaperMenuWidth

        anchor.rect.x: (Screen.width / 2) - (menuWidth / 2)
        anchor.rect.y: (Screen.height / 2) - (menuHeight / 2)
        
        WallSlide {
            anchors.fill: parent
            containerHeight: parent.height - parent.menuRadius
            containerWidth: parent.width - parent.menuRadius
            imageList: wallService.imageList
            barConfig: config

            onCloseRequested: {
                actionMenu.visible = false;
                wallService.queryProc.running = true;
            }
        }
    }
}
