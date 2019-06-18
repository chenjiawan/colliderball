import Felgo 3.0
import QtQuick 2.0
import "./scenes"
import"./common"
import ".."
import"./control"
import "./entities"
import"./scenes"
import"./menus"
import QtQuick.Controls 2.3

GameWindow {
    id: window
    //    screenWidth: 460
    //    screenHeight: 640
    visible: true

    property alias gameScene: gameScene

    EntityManager {
        id: entityManager
    }

    //菜单场景

    SwipeView{
        id: menuScene
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        currentIndex: tabBar.currentIndex
        HomePage{
            id:page1
            onSelectLevelPressed: {
                window.state = "selectLevel"
                console.log("selectlevel clicked")
            }
            onBackButtonPressed: {
                nativeUtils.displayMessageBox(qsTr("是否退出游戏?"), "" , 3);
            }
            // listen to the return value of the MessageBox
            Connections {
                target: nativeUtils
                onMessageBoxFinished: {
                    // only quit, if the activeScene is menuScene - the messageBox might also get opened from other scenes in your code
                    if(accepted && window.activeScene === menuScene)
                        Qt.quit()
                }
            }

        }
        StorePage{
            id:page2
        }
        ActivityPage{
            id:page3
        }
        SettingPage{
            id:page4
        }
    }
    TabBar{
        id:tabBar
        currentIndex: swipeview.currentIndex
        y:parent.height-home.height
        TabButton{
            id:home

            text:qsTr("关卡")
            opacity: 0.5
            width:window.width/4
            height: window.height/9
            Image {
                focus: true
                id: homeiamge
                source: "../../assets/img/homebutton.png"
                anchors.fill: parent
            }
        }
        TabButton{
            focus: true
            text:qsTr("商店")
            width:window.width/4
            height: window.height/9
            opacity: 0.5
            Image {
                id: storeiamge
                source: "../../assets/img/storebutton.png"
                anchors.fill: parent
            }
        }
        TabButton{
            focus: true
            text:qsTr("活动")
            font.pixelSize: 12
            width: window.width/4
            height: window.height/9
            opacity: 0.5
            Image {
                id: acitivityiamge
                source: "../../assets/img/acitivitybutton.png"
                anchors.fill: parent
            }
        }
        TabButton{
            opacity: 0.5
            focus: true
            text:qsTr("设置")
            font.pixelSize: 12
            width: window.width/4
            height: window.height/9
            Image {
                id: settingiamge
                source: "../../assets/img/settingbutton.png"
                anchors.fill: parent
            }
        }
    }


    //选择关卡场景
    SelectLevelScene {
        id: selectLevelScene
        onLevelPressed: {
            // selectedLevel is the parameter of the levelPressed signal
            gameScene.setLevel(selectedLevel)
            window.state = "game"

        }
        onBackButtonPressed: window.state = "menu"
    }


    //一关的游戏场景
    GameScene {
        id: gameScene
        onBackButtonPressed: window.state = "selectLevel"
    }

    //菜单场景时第一个场景，所以初始化为菜单场景
    state: "menu"
    activeScene: menuScene

    //状态机 takes care reversing the PropertyChanges when changing the state, like changing the opacity back to 0
    states: [
        State {
            name: "menu"
            PropertyChanges {target: menuScene; opacity: 1}
            PropertyChanges {target: window; activeScene: menuScene}
        },
        State {
            name: "selectLevel"
            PropertyChanges {target: selectLevelScene; opacity: 1}
            PropertyChanges {target: window; activeScene: selectLevelScene}
        },
        State {
            name: "game"
            PropertyChanges {target: gameScene; opacity: 1}
            PropertyChanges {target: window; activeScene: gameScene}
        }
    ]
}
