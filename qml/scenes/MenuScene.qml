import Felgo 3.0
import QtQuick 2.0
import "../common"
import ".."
import"../control"
import "../entities"
import"../scenes"

//菜单场景
SceneBase {
    id: menuScene

    // signal indicating that the selectLevelScene should be displayed
    signal selectLevelPressed
    // signal indicating that the creditsScene should be displayed
    signal creditsPressed

    // 背景
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "lightsteelblue"
    }

    // "L O G O!!!!"
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        font.pixelSize: 30
        color: "#e9e9e9"
        text: "Collider Ball"
    }

    // 菜单
    Column {
        anchors.centerIn: parent
        spacing: 10
        MenuButton {
            text: "Levels"
            onClicked: selectLevelPressed()
        }
    }
}
