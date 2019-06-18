import Felgo 3.0
import QtQuick 2.2
import "../common"
import"../common"
import ".."
import"../control"
import "../entities"
import"../scenes"
SceneBase {
    id:gameScene

    PhysicsWorld {
        id: world
        updatesPerSecondForPhysics: 60
        debugDrawVisible: true

    }

    // the filename of the current level gets stored here, it is used for loading the
    property string activeLevelFileName
    // the currently loaded level gets stored here
    property variant activeLevel

    // countdown shown at level start
    property int countdown: 0

    // set the name of the current level, this will cause the Loader to load the corresponding level
    function setLevel(fileName) {
        activeLevelFileName = fileName
    }


    // 背景
    Rectangle {
        anchors.fill: parent.gameWindowAnchorItem
        color: "lightblue"
    }


    //这里是剩余生命值（图片显示生命值）
    Repeater{
        model: 10
        Image {
            id: name
            source: ""
        }
    }

    // 运行时加载关卡
    Loader {
        id: loader
        source: activeLevelFileName != "" ? "../levels/" + activeLevelFileName : ""
        onLoaded: {
            // since we did not define a width and height in the level item itself, we are doing it here
            item.width = gameScene.width
            item.height = gameScene.height
            // store the loaded level as activeLevel for easier access
            activeLevel = item
            // restarts the countdown
            countdown = 5
        }
    }

    // we connect the gameScene to the loaded level
    Connections {
        // only connect if a level is loaded, to prevent errors
        target: activeLevel !== undefined ? activeLevel : null
    }

    // if the countdown is greater than 0, this timer is triggered every second, decreasing the countdown (until it hits 0 again)
    Timer {
        repeat: true
        running: countdown > 0
        onTriggered: {
            countdown--
        }
    }

//    Camera {
//          id: camera

//          focus: false
//          // set the gameWindowSize and entityContainer required for the camera
//          gameWindowSize: Qt.point(gameScene.gameWindowAnchorItem.width, gameScene.gameWindowAnchorItem.height)
//          entityContainer: gameScene

//          // if you don't set the focusedObject property, or set it to null, the camera is freely movable
//          focusedObject: player

//          // set the camera's limits
//          limitLeft: 0
//          limitRight: 600
//          limitTop: 0
//          limitBottom: 400
//        }
}
