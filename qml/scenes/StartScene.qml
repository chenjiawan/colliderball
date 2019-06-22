import Felgo 3.0
import QtQuick 2.0
import "../common"

//开始游戏场景
SceneBase {
    id: startScene
    anchors.fill: parent

    signal startGameclicked

    Rectangle{
        anchors.fill: parent
        color: "lightsteelblue"
        //背景图片
        Image {

            id: img
            anchors.centerIn: parent
            source: "../../assets/img/bg2.jpg"
            anchors.fill: parent
        }
    }

    //开始场景的text
    Text {
        id: startTexts
        font.pixelSize: 15
        color: "white"
        font.family: ""         //字体风格
        text: qsTr("触摸任意位置开始游戏")
        anchors.centerIn: parent
        opacity: 1

        //一组连续的对opacity属性动画
        SequentialAnimation{
            running: true
            loops: Animation.Infinite

            PropertyAnimation{
                property: "opacity"
                target: startTexts
                duration: 500
                from: 1
                to: 0
            }

            PropertyAnimation{
                property: "opacity"
                target: startTexts
                duration: 500
                from: 0
                to: 1
            }
        }
    }

    //全屏任意位置触摸开始游戏
    MouseArea{
        anchors.fill: parent
        onClicked: {
            startGameclicked()
        }
    }
}
