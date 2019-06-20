import QtQuick 2.0
import Felgo 3.0
import "../common" as Common

import ".."
import"../control"
import "../entities"
import"../scenes"

//关卡在gameScene被加载
Common.LevelBase {

    id:level1
    //第一关
    levelName: "Level1"

    Wall{
        height: 450
        width: 10
        x:0
        y:0
    }
    Wall{
        height: 10
        width: 500
        x:0
        y:0
    }
    Wall{
        height: 10
        width: 500
        x:0
        y:450
    }
    Wall{
        height: 450
        width: 10
        x:300
        y:0
    }
}

