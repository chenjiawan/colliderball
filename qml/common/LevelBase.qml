import QtQuick 2.0
import Felgo 3.0
import"../common"
import ".."
import"../control"
import "../entities"
import"../scenes"

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

    Player{
        id:playerRed
        ball.originX: 100+width/2
        ball.originY: 250 + height/2
        anchors.bottom: GameScene.bottom
        // anchors.centerIn: GameScene.Center
    }


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


}
