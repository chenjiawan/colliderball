import Felgo 3.0
import QtQuick 2.0
import"../common"
import ".."
import"../control"
import "../entities"
import"../scenes"

EntityBase {
    id: entity
    entityType: "wall"

    BoxCollider {
        id: boxCollider
        bodyType: Body.Static
        // the size of the collider is the same as the one from entity by default
    }

    Rectangle {
        anchors.fill: parent
        color: "blue"
        visible: true
    }
}
