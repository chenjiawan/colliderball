import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.3

import"../common"
import ".."
import"../control"
import "../entities"
import"../scenes"


//主页
Scene{
    id:homepage

    opacity: 1

    signal selectLevelPressed       //选择关卡按钮被按下信号
    signal playerChanged       //玩家姓名输入完毕信号

    //设置背景图片
    BackgroundImage {
        anchors.fill: parent
        id: homebackgroundimage
        source: "../../assets/img/homepage.png"
    }

    //选择关卡按钮
    MenuButton{
        id:select
        width: parent.width/3
        height: parent.height/12
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.topMargin: parent.height/1.4
        anchors.leftMargin: parent.width/2-width/2
        text: qsTr("选择关卡")
        onClicked:
        {
            selectLevelPressed()
        }
        Image {
            anchors.fill: parent
            source: "../../assets/img/homebuttonclicked.jpg"
        }
    }

    //返回按钮
    MenuButton {
        z:2
        text: "Back"
        width: parent.width/8
        height: parent.height/16
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        onClicked: backButtonPressed()
        Image {
            id: backimage
            source: "../../assets/img/homebuttonclicked.jpg"
            anchors.fill:parent
        }
    }

    property alias playerName: playerName
    //新的角色
    Rectangle{
        width: 240
        height: 150

        radius: 10
        anchors.bottom: createId.top
        anchors.bottomMargin: 100
        anchors.horizontalCenter: parent.horizontalCenter

        color: "lightsteelblue"
        opacity: 0
        id:newPlayer
        enabled: opacity > 0

        //创建新用户Dialog
        Text {
            id: dialogtxt
            font.pixelSize: 20
            text: qsTr("创建新玩家")
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
        }

        TextInput{
            activeFocusOnPress: true
            autoScroll: true
            font.pixelSize: 20
            text: "enter yur name"
            color: "white"

            cursorVisible: true
            id:playerName
            anchors.top: dialogtxt.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }

        MenuButton {
            id: confirmButton
            text: qsTr("确认")
            anchors.top: playerName.bottom
            anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                newPlayer.opacity = 0
                createId.opacity = 1
                select.opacity = 1
            }
        }
    }


    //新的游戏按钮
    MenuButton{
        id:createId
        text: "New Game"
        anchors.bottom: select.top
        anchors.bottomMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        height: 40
        width: 120

        onClicked: {
            newPlayer.opacity = 1
            createId.opacity = 0
            select.opacity = 0
        }
    }
}










