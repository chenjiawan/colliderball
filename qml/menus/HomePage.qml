import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.3

import "../scenes"
import"../common"
import ".."
import"../control"
import "../entities"
import"../scenes"

SceneBase{
    id:homepage

    signal selectLevelPressed

    //背景
    Rectangle{
        id:homerctangle
        width: parent.width
        height: parent.height
    }
    // "L O G O!!!!"
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        font.pixelSize: 30
        color: "black"
        text: "Collider Ball"
    }
    MenuButton{
        text: qsTr("开始游戏")
        x:parent.width/3
        y:parent.height/1.4
        onClicked:
        {
            console.log("start clicked")
            selectLevelPressed()
        }


    }
    MenuButton {
        text: "Back"
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        onClicked: backButtonPressed()
    }
}
