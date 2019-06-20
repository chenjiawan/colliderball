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

    property alias playerRed: playerRed
    property alias ballRed: playerRed.ball
    property string levelName

    Item{
        id:gameWindowAnchorItem
        x:gameScene.gameWindowAnchorItem.x
        y:gameScene.gameWindowAnchorItem.y
        width: gameScene.gameWindowAnchorItem.width
        height: gameScene.gameWindowAnchorItem.height
    }

    //玩家
    Player{
        id:playerRed
        ball.originX: 100+width/2
        ball.originY: 250 + height/2
    }

    //玩家剩余生命值显示图片
    Image {
        id: lifeImg
        source: ""
    }

    //玩家剩余生命值显示数目
    Text{
        id:lifeNum
        text: ""
    }

    //玩家移动
    Move{
        z:2
        id:moveRed
        player: playerRed

        ball:playerRed.ball
        //originX: gameWindowAnchorItem.width - playerMovementImage.width - 10
        //originY: 10
        anchors{
            left: gameWindowAnchorItem.left
            right: gameWindowAnchorItem.right
            top: gameWindowAnchorItem.top
        }
        height: gameWindowAnchorItem.height / 2
    }

    //返回选择关卡按钮
    MenuButton{
        z:1
        width: 30
        height: 30
        // 锚定向返回按钮
        anchors.right:gameWindowAnchorItem.right
        anchors.rightMargin: 10
        anchors.top: gameWindowAnchorItem.top
        onClicked: {
            backButtonPressed()
            resetLevel()
        }

        //返回按钮
        Image {
            id: backimg
            source: "../../assets/img/Back.png"
            anchors.fill: parent
        }
    }

    //相机
    //    Camera{
    //        id:camera
    //        focusedObject: playerRed

    //        //mouseAreaEnabled: false
    //        gameWindowSize: Qt.point(gameWindowAnchorItem.width,gameWindowAnchorItem.height)
    //        entityContainer: level1
    //    }

    //重置所有游戏变量和玩家组件
    function resetLevel(){
        activeLevelFileName = ""

        GameInfo.gameOver = false
        //删除实体
        entityManager.removeEntitiesByFilter()
        var toRemoveEntityTypes = [""];
        playerRed.reset()
    }

    //游戏场景音效
}
