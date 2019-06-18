import Felgo 3.0
import QtQuick 2.0
import QtQuick.Controls 2.3
import "../scenes"
import"../common"
import ".."
import"../control"
import "../entities"
import"../scenes"

Scene{
    id:storepage

    Rectangle{
        id:hole1
        width: parent.width
        height: parent.height
        Button{
            text: qsTr("新000")
            id:hairubutton
            width: 100
            height: 50
            x:parent.width/3
            y:parent.height/1.4        }
    }

}
