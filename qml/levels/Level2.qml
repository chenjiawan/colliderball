import QtQuick 2.0
import Felgo 3.0
import "../common" as Common

import ".."
import"../control"
import "../entities"
import"../scenes"

Common.LevelBase {
    //第一关
    levelName: "Level1"

    Wall{
        height: 400
        width: 10
        x:0
        y:0
    }
}

