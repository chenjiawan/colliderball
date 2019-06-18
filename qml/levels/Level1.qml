import QtQuick 2.0
import Felgo 3.0
import "../common" as Common
import"../common"
import ".."
import"../control"
import "../entities"
import"../scenes"

Common.LevelBase {
    levelName: "Level1"

    // 这里应该是暂停函数
    MenuButton {
        text: "Back"
        // anchor the button to the gameWindowAnchorItem to be on the edge of the screen on any device
        onClicked: {
            backButtonPressed()
            activeLevel = undefined
            activeLevelFileName = ""
        }
    }

    Wall{
        height: 400
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
        y:400
    }
    Wall{
        height: 400
        width: 10
        x:300
        y:0
    }
}

