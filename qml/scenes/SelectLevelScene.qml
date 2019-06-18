import Felgo 3.0
import QtQuick 2.0
import "../common"
import"../common"
import ".."
import"../control"
import "../entities"
import"../scenes"
SceneBase {
    id: selectLevelScene

    // signal indicating that a level has been selected
    signal levelPressed(string selectedLevel)

    // 背景
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "#ece468"
    }

    // 返回按钮
    MenuButton {
        text: "Back"
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        anchors.right: selectLevelScene.gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: selectLevelScene.gameWindowAnchorItem.top
        anchors.topMargin: 10
        onClicked: backButtonPressed()
    }

    // 选择关卡
    Grid {
        anchors.centerIn: parent
        spacing: 10
        columns: 5
        MenuButton {
            text: "1"
            width: 50
            height: 50
            onClicked: {
                levelPressed("Level1.qml")
            }
        }
        MenuButton {
            text: "2"
            width: 50
            height: 50
            onClicked: {
                levelPressed("")
            }
        }
        MenuButton {
            text: "3"
            width: 50
            height: 50
            onClicked: {
                levelPressed("")
            }
        }
        Repeater {
            model: 10
            MenuButton {
                text: " more "
                width: 50
                height: 50
            }
        }
    }
}
