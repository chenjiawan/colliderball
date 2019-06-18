import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.3
import QtMultimedia 5.0
import "../scenes"
import"../common"
import ".."
import"../control"
import "../entities"
import"../scenes"

Scene{
    id:settingpage

 signal settingsPressed
    //    function playbgmusic(){
    //        if(checkState == "Qt.checked")
    //            playmusic.play();
    //        else{
    //            playmusic.pause();
    //        }
    //    }

    BackgroundMusic{
        id:playmusic1
        source: ""
        loops: SoundEffect.Infinite
        volume: 0.35
        //Settings.musicEnabled: true

        // autoLoad: true
        autoPauseInBackground:true
    }
    Timer {
      id: timerMusic
      interval: 100; running: true; repeat: true;
      onTriggered: {
        playmusic1.play()
        running = false
      }
    }

    Image {
        z: -2
        id: background
        source: "../../assets/img/SettingsBG.png"

    }
    Rectangle{
        id: rectangle

        Column{
            x: 100
            anchors.top: parent.top
            anchors.topMargin: 43
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 40
            anchors.horizontalCenterOffset: 0
            spacing: 20
            Text {
                //        if(checkState == "Qt.checked")
                x: 121

                font.pixelSize: 24
                text: "设置"
                color: "black"
            }

            Text {

                font.pixelSize: 12
                text: "声音"
                color: "black"
            }
            Text {
                font.pixelSize: 12
                text: "显示摇杆"
                color: "black"
            }
            Text {
                font.pixelSize: 12
                text: "语言"
                color: "black"
            }
            Text {


                font.pixelSize: 12
                text: "帮助"
                color: "black"
            }
            Text {
                x: 121

                font.pixelSize: 12
                text: "V 1.0"
                color: "black"
            }
        }

        Column {
            id: column
            x: 267
            y: 95
            width: 65
            height: 148
            MenuButton {
              width: 90
              height: 40

            }


            CheckBox {
                id: checkBox1
                width: 30
                height: 30

            }
        }

        ComboBox {
            opacity: 0.5
            id: comboBox
            x: 210
            y: 155
            width: 104
            height: 33
            font.underline: false
            font.bold: true
            font.pixelSize: 12
            font.family: "Arial"
            currentIndex: 2
            focusPolicy: Qt.ClickFocus
            textRole: "key"
            model: ListModel {
                ListElement { key: "简体中文"; value: 123 }
                ListElement { key: "English"; value: 456 }
                ListElement { key: "繁體中文"; value: 789 }
            }
        }
    }
}
