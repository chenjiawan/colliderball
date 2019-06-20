import Felgo 3.0
import QtQuick 2.0
import "../common"
import ".."
import"../control"
import "../entities"
import"../scenes"

//选择关卡场景
SceneBase {
    id: selectLevelScene

    // 一个关卡已经被选择的信号
    signal levelPressed(string selectedLevel)

    // 背景
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "lightSteelblue"
    }

    // 返回按钮
    MenuButton {
        text: "Back"

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
                levelPressed("Level2.qml")
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

        Repeater {      //重复的关卡按钮
            model: 10
            MenuButton {
                text: " more "
                width: 50
                height: 50
            }
        }
    }
}
