import Felgo 3.0
import QtQuick 2.0
import"../common"
import ".."
import"../control"
import "../entities"
import"../scenes"

//玩家
EntityBase {
    id:player
    entityType: "player"

    //property int life: GameInfo.remainLife
    property alias ball: ball
    property int life
    property alias player: player

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
            life = life--
            reset()
        }

        //剩余生命低于0,结束游戏
        if (life < 0) {
            endGame()
        }
    }

    function endGame(){

        //显示游戏结束界面
        endGame.play();

        //暂停，停止游戏
        //GameInfo.gamePaused = true
        GameInfo.gameOver = true

        reset();
    }

    //重置玩家变量，生命值减1 并重置位置
    function reset(){
        ball.x = ball.originX;
        ball.y = ball.originY;
    }
}
