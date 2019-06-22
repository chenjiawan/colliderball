import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.3
import "../scenes"
import"../common"
import ".."
import"../control"
import "../entities"
import QtMultimedia 5.9

//商店页面
SceneBase{
    opacity: 1
    id:storepage

    //背景图片
    BackgroundImage {
        anchors.fill: parent
        //            scale: 0.5
        //            z:-2
        id: storebackgrounsimage
        source: "../../assets/img/storepage.png"
    }

    ListView{
        //            visible: false
        id:balllistview
        z:2
        x: storepage.width/2-width/2
        y: storepage.height/2+height/2
        width: parent.width/3.5
        height: parent.height/8
        //            highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        //            focus: true
        //            orientation控制是水平还是竖直的 Qt.Horizontal表示为水平的  Qt.Vertical表示为竖直的 默认为竖直的
        orientation: Qt.Horizontal
        //             flickableDirection:  Flickable.AutoFlickIfNeeded
        //            设置这些属性中的任何一个都将平滑地滚动ListView，以便当前项变为可见
        highlightFollowsCurrentItem:true
        //            currentIndex属性保存当前项的索引，currentItem保存当前项
        //            currentIndex: 0
        //当移动图片时，使currentIndex也发生变化
        highlightRangeMode: ListView.StrictlyEnforceRange
        //            flickableDirection:Flickable.horizontalCenter

        snapMode: ListView.SnapOneItem
        //            layoutDirection: Qt.LeftToRight
        model: BallcolorModel{}
        delegate: contactDelegate
        Component{

            id:contactDelegate
            Item {
                id:ballItem
                width: balllistview.width
                height:balllistview.height
                opacity: ListView.isCurrentItem?  1 : 0.5
                //                Column{
                //                    x: storepage.width/2-width/2
                //                    y: storepage.height/2+height/2
                //                    width: parent.width/3.5
                //                    height: parent.height/8
                Text {
                    color: "white"
                    id:textball
                    //                    width:parent.width
                    //                    height: parent/3
                    //                    anchors.top: parent.top
                    //                    anchors.topMargin: 0

                    text: balltext
                    opacity: ballItem.ListView.isCurrentItem?  1 :0
                    anchors.bottom: imageball.top
                    anchors.bottomMargin: 0

                }
                Image {
                    id:imageball
                    //                    width: balllistview.width
                    //                    height: balllistview/3*2
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    //                    anchors.fill: parent
                    source: portrait
                    scale: ballItem.ListView.isCurrentItem? 0.75:0.5
                }
            }
        }
    }
    //                    }

    MenuButton {
        id: storeButton
        x: storepage.width/2-width/2
        y: parent.height/1.4
        width: parent.width/3
        height: parent.height/12

        Image {
            anchors.fill: parent
            id: storeimage
            source: "../../assets/img/storebutton1.jpg"
        }
    }

    //商店界面音效
    BackgroundMusic{
        id:storeMusic
        autoPlay: false
        loops: SoundEffect.Infinite
        autoPauseInBackground:true
        source: "../../assets/sond/StoreScene.mp3"
    }
}
