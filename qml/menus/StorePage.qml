import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.3
import "../scenes"
import"../common"
import ".."
import"../control"
import "../entities"
import"../scenes"
import QtMultimedia 5.9

//商店页面
Scene{
    id:storepage

    Rectangle{
        id:hole1
        width: parent.width
        height: parent.height
        MenuButton{
            text: qsTr("商店")
            id:store
            width: 100
            height: 50
            x:parent.width/3
            y:parent.height/1.4
        }
    }

    //商店界面音效
    SoundEffect{

    }
}
