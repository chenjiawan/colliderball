pragma Singleton
import QtQuick 2.0
import Felgo 3.0


//游戏配置信息
QtObject {
    id: gameInfo


    property int remainLife: 3          //剩余生命值
    property bool gameOver: false       //游戏结束

    property int border: 2              //边框
    property int radius: 7              //

}
