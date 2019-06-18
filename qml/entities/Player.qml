import Felgo 3.0
import QtQuick 2.0
import"../common"
import ".."
import"../control"
import "../entities"
import"../scenes"

EntityBase {
    id:player
    entityType: "player"

    //property int life: GameInfo.remainLife
    property alias ball: ball

//    Canvas{
//        id:canvas
//        anchors.fill: parent
//        antialiasing: true
//        onPaint: {
//            var context = canvas.getContext("2d")
//            context.clearRect(0,0,width,height)
//            context.fillRect(ball.controller.xAxis,ball.controller.yAxis,40,2);
//            context.stroke()

//        }
//    }

    Ball{
        id:ball
        rotation: 0
    }

    //球体被摧毁时播放声音
    SoundEffect{
        volume: 0.3
        id: balldestroyedsong
        source:""
    }

    //球体被摧毁，重新开始函数function
    function onDamagerestart(){

        //如果剩余生命值不为0,减去一滴生命
        if (!GameInfo.gameOver){
            life = life - 1
            reset()
        }

        //剩余生命低于0,结束游戏
        if (life <= 0) {
          endGame()
        }
    }

    function endGame(){

        //显示游戏结束界面
        endGame.play();

        //暂停，停止游戏
        GameInfo.gamePaused = true
        GameInfo.gameOver = true
    }

    // reset all player variables, restor health and reset position & rotation
    //重置玩家变量，恢复健康并重置位置和旋转
    function reset(){
      ball.x = ball.originX;
      ball.y = ball.originY;
    }
}
