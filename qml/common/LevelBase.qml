import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.3
import"../common"
import ".."
import"../control"
import "../entities"
import"../scenes"

//关卡内的基础
Item {
    id:levelBaseScene

    property alias player: player
    property alias ball: player.ball
    property alias timeText:countDown.text
    property string levelName

    property int gameOverSceneOpacity: 0
    property int time : 3

    //玩家
    Player{
        id:player
        ball.originX: parent.x + 50
        ball.originY:parent.y + 50
    }

    //玩家移动
    Move{
        enabled: (gameOverSceneOpacity || loadScene.opacity) <= 0

        z:2
        id:moveRed
        player: player

        ball:player.ball

        anchors{
            left: parent.left
            right: parent.right
            top: parent.top
        }
        height: parent.height / 2
    }



    //玩家剩余生命值显示图片
    Image {
        z:4
        id: lifeImg
        width: 20
        height: 20
        source: "../../assets/img/ball2.png"
        anchors.left: parent.left
        anchors.top: parent.top
    }

    //显示玩家血量
    Text {
        z:4
        id: bloodTxt
        color: "red"
        font.pixelSize: 20
        anchors.left: lifeImg.right
        anchors.top: lifeImg.top
        text:"x" + player.life
    }

    //返回选择关卡按钮
    Image {
        id: backimg
        source: "../../assets/img/return.png"
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 0
        anchors.right: parent.right

        z:3
        width: 40
        height: 40

        //返回鼠标区域
        MouseArea{
            z:3         //置于最少层使按钮可被随时点击
            width: 30
            height: 30
            opacity: 1
            anchors.fill: parent
            hoverEnabled: true      //鼠标悬停，悬停允许处理所有鼠标事件，即使没有按下鼠标按钮。

            visible: parent.opacity > 0
            enabled: visible

            // 锚定向返回按钮
            anchors.right:parent.right
            anchors.rightMargin: 10
            anchors.top: parent.top

            onClicked: {
                parent.scale = 1.0
                backButtonPressed()
                resetLevel()
                player.gameoverstop()
            }
            onPressed: {
                parent.scale = 0.85
                parent.opacity = 0.5
            }
            onReleased: {
                parent.scale = 1.0
                parent.opacity = 1
            }
            onCanceled: {
                parent.scale = 1.0
            }
        }
    }

    //重置所有游戏变量和玩家组件
    function resetLevel(){
        activeLevelFileName = ""

        gameOverSceneOpacity = 0
        //如果剩余生命值为小于0删除实体,显示游戏结束画布选择，否则重置小球位置
        var toRemoveEntityTypes = [""];

        entityManager.removeEntityById()

        console.log("resetlevel")

    }

    function restartLevel(){
        activeLevelFileName = "Level1.qml"

        gameOverSceneOpacity = 0
        console.log("gameOverSceneOpacity: " + gameOverSceneOpacity)
        //如果剩余生命值为小于0删除实体,显示游戏结束画布选择，否则重置小球位置
        console.log("restartlevel")
    }


    //加载游戏场景
    Rectangle{
        z:100
        id:loadScene
        color:"lightblue"
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        //        radius: 10
        opacity:time > 0? 1:0
        enabled: opacity


        Text {
            anchors.centerIn: parent
            color: "Black"
            font.pixelSize: 50
            id: countDown
            text: time
        }

        Timer{
            id:count
            repeat: true
            running: true
            interval: 1000
            onTriggered: {
                time --
                player.diamondNum.load()
                stopTimer()

            }
        }
    }
    function stopTimer(){
        if(timeText <= "0")
        {
            count.stop()
            loadScene.opacity = 0
        }
    }



    //显示游戏结束的窗口
    Rectangle{
        z:100
        id:gameOverScene
        color:"lightblue"
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        //        radius: 10
        opacity:gameOverSceneOpacity
        enabled: opacity

        Text {
            id: continueTxt
            anchors.top: parent.top
            anchors.topMargin: 200
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("you have die")
        }

        MenuButton{
            id:restart

            anchors.top: continueTxt.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: continueTxt.horizontalCenter

            text:"重新开始"

            enabled: visible

            onClicked: {
                gameOverScene.opacity = 0
                console.log("重新开始游戏")

                console.log("visible: " + parent.visible)
                console.log("enabled: " + parent.enabled)
                gameOverSceneOpacity = 0
                player.life = 3
                restartLevel()
                player.gameoverstop()
                loadScene.opacity = 1
                time = 3
                count.restart()
            }
        }

        MenuButton{
            id:continueBtn

            anchors.top: restart.bottom
            anchors.topMargin: 10
            anchors.horizontalCenter: restart.horizontalCenter

            text:"取消"

            onClicked: {
                gameOverScene.opacity = 0
                console.log("取消")
                backButtonPressed()
                gameOverSceneOpacity = 0
                player.life = 3
                player.gameoverstop()
                resetLevel()
                backButtonPressed()
                player.diamondNum.onDiamondChanged()
            }
        }
    }

    //显示生命值减去1 的窗口
    RestartScene{
        id:restartDialog

    }
    //游戏场景音效

}
