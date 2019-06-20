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

    signal selectLevelPressed

    //背景
    Rectangle{
        id:homerctangle
        width: parent.width
        height: parent.height
    }

    // "项目 L O G O!!!!"
    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        font.pixelSize: 40
        color: "black"
        text: "Collider Ball"
    }

    //选择关卡按钮
    MenuButton{
        text: qsTr("选择关卡")
        x:parent.width/3
        y:parent.height/1.4
        onClicked:
        {
            //console.log("start clicked")
            selectLevelPressed()
        }
    }
}
