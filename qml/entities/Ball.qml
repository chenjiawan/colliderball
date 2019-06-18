import Felgo 3.0
import QtQuick 2.0
import"../common"
import ".."
import"../control"
import "../entities"
import"../scenes"

EntityBase {
    entityType: "ball"
    entityId: "ball"

    id: ball
    x: originX
    y: originY

    property alias controller: twoAxisController
    property alias circleCollider: circleCollider
    property double originX
    property double originY

    //设置驱动力大小
    //readonly property real forwardForce: 8000 * world.pixelsPerMeter

    // 这个控制帮助控制角色移动
    TwoAxisController {
      id: twoAxisController

      // 提供按下时的逻辑功能 (预判线方向改变，子弹时间)
      //onInputActionPressed: handleInputAction(actionName)
    }

    //球体的可视体
    Rectangle {
        height: 16
        width: 16
        radius: 10
        id: ballbody
        anchors.centerIn: parent

        color: "black"  //(颜色，可改变，皮肤功能实现，商城)
    }

    //球体物理特性
    CircleCollider {
        x:-radius
        y:-radius
        height: 16
        width: 16
        id:circleCollider
        //enabled: !GameInfo.gamePaused
        radius: 10
        density: 0.02
        friction: 0.4
        restitution: 1
        body.bullet: true
        body.linearDamping: 0      //线性阻尼，摩擦力（值越小跳动越厉害）
        body.angularDamping: 15     //角阻尼，（值越小转动越快）

        fixture.onBeginContact: {
            var colliderEntity = other.getBody().target;
            var otherEntity = colliderEntity.entityId;
        }

        //更新物理标记
        linearVelocity: Qt.point(controller.xAxis * 100, controller.yAxis * (-100))

        //force: Qt.point(twoAxisController.xAxis*forwardForce, twoAxisController.yAxis*-forwardForce)
        //torque: twoAxisController.xAxis*100 * world.pixelsPerMeter * world.pixelsPerMeter

        //球体碰撞声音
        SoundEffect{
            volume: 0.3
            id: colliderSound
            source: ""
        }
    }



    //按下后功能处理的函数
//    function handleInputAction(action) {
//      if( action === "fire") {
//        // x&y of this component are 0..
//        console.debug("creating weapon at current position x", car.x, "y", car.y)
//        console.debug("image.imagePoints[0].x:", image.imagePoints[0].x, ", image.imagePoints[0].y:", image.imagePoints[0].y)

//        // this is the point that we defined in Car.qml for the rocket to spawn
//        var imagePointInWorldCoordinates = mapToItem(level,image.imagePoints[0].x, image.imagePoints[0].y)
//        console.debug("imagePointInWorldCoordinates x", imagePointInWorldCoordinates.x, " y:", imagePointInWorldCoordinates.y)

//        // create the rocket at the specified position with the rotation of the car that fires it
//        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Rocket.qml"), {"x": imagePointInWorldCoordinates.x, "y": imagePointInWorldCoordinates.y, "rotation": car.rotation})

//      }
//    }
}
