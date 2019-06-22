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
        id: wall
        height: 450
        width: 10
        x:20
        y:8
    }

    Wall{
        id: wall1
        height: 10
        width: 100
        x:20
        y:108
    }
    Wall{
        id: wall7
        height: 16
        width: 69
        x:245
        y:250
    }
    Wall{
        id: wall8
        height: 253
        width: 14
        x:181
        y:18
    }
    Wall{
        id: wall9
        height: 13
        width: 72
        x:258
        y:359
    }
    Wall{
        id: wall10
        height: 10
        width: 100
        x:20
        y:280
    }
    Wall{
        id: wall11
        height: 10
        width: 100
        x:20
        y:386
    }

    Wall{
        id: wall2
        height: 100
        width: 10
        x:110
        y:108
    }


    Wall{
        id: wall4
        height: 11
        width: 310
        x:20
        y:8
    }
    Wall{
        id: wall5
        height: 10
        width: 310
        x:20
        y:458
    }
    Wall{
        id: wall6
        height: 450
        width: 10
        x:320
        y:8
    }

    Wall{
        id: wall13
        height: 157
        width: 12
        x:258
        y:8
    }
    Wall{
        id: wall14
        height: 99
        width: 10
        x:181
        y:354
    }
}

