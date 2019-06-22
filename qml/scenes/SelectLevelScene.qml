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
    opacity: 0

    // 一个关卡已经被选择的信号
    signal levelPressed(string selectedLevel)

    // 背景
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "lightSteelblue"

        // 选择关卡
        Grid {
            anchors.centerIn: parent
            spacing: 10
            columns: 5
            MenuButton {
                z:-1
                text: "1"
                width: 50
                height: 50
                onClicked: {
                    levelPressed("Level1.qml")
                }
            }
            MenuButton {
                z:-1
                text: "2"
                width: 50
                height: 50
                onClicked: {
                    levelPressed("Level2.qml")
                }
            }
        }
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
}
