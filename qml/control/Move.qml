import QtQuick 2.0
import Felgo 3.0
import "../common" as Common
import ".."
import "../entities"
import "../control"
import "../levels"
import "../scenes"

// 玩家的控制区域整个游戏场景
Rectangle {
    id: movement
    anchors.fill: parent
    color: "transparent"
    focus: true

    // 目标玩家和坦克是从外面设置的
    property var player
    property var ball
    property double originX
    property double originY

    //此图像显示控制器并用于计算玩家的移动
    Image {
        id: playerMovementImage
        source: "../../assets/img/光圈.png"
        z: 5
        width: 40
        height: 40
        x: originX
        y: originY
        opacity: 0
    }

    // 多点触控区域  覆盖半个屏幕，当游戏暂停时禁用。
    MultiPointTouchArea {

        z: -1
       //enabled: GameInfo.gamePaused ? false : true
        anchors.fill: parent

        property var canvas

        // 参考点是多点触摸区内圆形控制器垫的中心
        property int referencePointX: 0
        property int referencePointY: 0

        // 释放鼠标或手指后，需要新的参考点
        property bool didRegisterReferencePoint: false;

        // 访问玩家的控制器来添加移动的计算
        property variant playerTwoAxisController: ball.getComponent("TwoAxisController")


        //新位置是从焊盘中心计算的点
        //值被转换并在1（=圆形垫的边框）左右变化。
        //用于计算玩家的速度
        property real newPosX: 0.0
        property real newPosY: 0.0


        touchPoints: [
            TouchPoint {id: fieldPoint}
        ]

        onUpdated: {
            // 如果玩家正在移动，播放他的动画，不要让他慢下来。
            ball.circleCollider.linearDamping = 0

            //计算当前字段点与参考点的差
            //结果是一个1左右的值；较高的值在圆之外
            newPosX = ((fieldPoint.x - referencePointX + playerMovementImage.width / 2) / (playerMovementImage.width / 2) - 1)
            newPosY = ((fieldPoint.y - referencePointY + playerMovementImage.height / 2) / (playerMovementImage.height / 2) - 1)

            // 圆心与半径之间的距离
            var distance = Math.sqrt((newPosX*newPosX) + (newPosY*newPosY))


            //如果还没有加载参考点，则获取一个
            if (didRegisterReferencePoint == false) {
                // 注意有一个参考点
                didRegisterReferencePoint = true;

                // 保存新的参考点
                referencePointX = fieldPoint.x;
                referencePointY = fieldPoint.y;

                // 重新定位控件图像
                updatePlayerMovementImagePosition()
                return;
            }

            // 如果新点在运动控制圈之外
            if (distance > 1) {
                //角度用于在圆形垫的边界处查找参考点
                //计算两点之间的角度（零和新位置），并将其转换为度数和右坐标系
                var angle = (Math.atan2(newPosX, newPosY) * 180 / Math.PI) - 180
                angle = angle * (-1)
                angle -= 90

                //在圆形垫的边界处找到新的参考点
                //从旧参照点开始，选择半径距离正确的新点
                var newX = (playerMovementImage.width / 2) * Math.cos((angle) * Math.PI / 180) + referencePointX
                var newY = (playerMovementImage.height / 2) * Math.sin((angle) * Math.PI / 180) + referencePointY

                //计算边界参考点与圆盘外侧点的差
                var diffX = fieldPoint.x - newX
                var diffY = fieldPoint.y - newY

                //计算环形垫的新移动中心
                //确保新的参考点为圆形垫或图像留有足够的空间（半径）
                //与每个边界至少保持半径距离
                if ((referencePointX + diffX) <= (playerMovementImage.width / 2)){
                    referencePointX = playerMovementImage.width / 2
                }else if ((referencePointX + diffX) >= (movement.width - playerMovementImage.width/2)){
                    referencePointX = movement.width - playerMovementImage.width/2
                }else{
                    referencePointX += diffX
                }

                if ((referencePointY + diffY) <= playerMovementImage.height / 2){
                    referencePointY = playerMovementImage.height / 2
                }else if ((referencePointY + diffY) >= (movement.height - playerMovementImage.height / 2)){
                    referencePointY = movement.height - playerMovementImage.height / 2
                }else{
                    referencePointY += diffY
                }
            }

            // 根据鼠标或手指的移动重新定位控制图像
            updatePlayerMovementImagePosition()

            // 限制这个值在 1或-1
            newPosY = newPosY * -1
            if (newPosX > 1) newPosX = 1
            if (newPosY > 1) newPosY = 1
            if (newPosX < -1) newPosX = -1
            if (newPosY < -1) newPosY = -1

            // 更新运动
            updateMovement()
        }

        //------------------------------重新定位控制图像位置----------------------------------------
        function updatePlayerMovementImagePosition() {
            //参考点为中心，减去半径得到图像的左上角
            var newX = referencePointX - playerMovementImage.width / 2;
            var newY = referencePointY - playerMovementImage.height / 2;


            //该值必须为正数才能使图像位于字段内
            //该值必须足够小才能位于字段内，至少保留图像的宽度
            newX = Math.max(0, newX);
            newX = Math.min(movement.width - playerMovementImage.width, newX);
            newY = Math.max(0, newY);
            newY = Math.min(movement.height - playerMovementImage.height, newY);

            // 分配新地点
            playerMovementImage.x = newX;
            playerMovementImage.y = newY;

        }





        //----------------------从平板电脑中移除手指/释放鼠标后减慢角色速度--------------------------------
        function damping(){
                //ball.circleCollider.linearDamping = GameInfo.damping
        }

        //  ----------------------更新角色的速度和方向-------------------------------------
        function updateMovement(){

            // 调整速度
            //newPosX = newPosX * GameInfo.maximumPlayerVelocity
            //newPosY = newPosY * GameInfo.maximumPlayerVelocity

            //  计算与毕达哥拉斯中心的距离（=速度）
            var velocity = Math.sqrt(newPosX * newPosX + newPosY * newPosY)
            var maxVelocity = GameInfo.maximumPlayerVelocity


            //规范化速度，到中心的水平和垂直最大距离为1
            //因为它是一个正方形多点触摸区，所以到中心的对角线距离可以大于1
            //规格化值以获得统一的最大速度
            if (velocity > maxVelocity) {
                var shrinkFactor = maxVelocity / velocity
                newPosX = newPosX * shrinkFactor
                newPosY = newPosY * shrinkFactor
            }

            // 现在用计算的值更新双轴控制器
            // 双轴控制器用这个输入移动玩家
            playerTwoAxisController.xAxis = newPosX
            playerTwoAxisController.yAxis = newPosY

        }



        // ----------------玩家放开鼠标或者松开手指------------------------------
        onReleased: {
            // 下一个输入将是 新的参考点的 新接触点
            didRegisterReferencePoint = false;

            //放开控制图片消失
            playerMovementImage.opacity = 0

        }

        onPressed: {
            //点击的时候控制图片显示
            playerMovementImage.opacity = 1
            //drawDottLine();
            //时空减速
            damping()
        }
    }

    //-----------------------计算零点和第二个点之间的角度------------------------
    function calcAngle(touchX, touchY) {
        return -180 / Math.PI * Math.atan2(touchY, touchX)
    }

    //-----------------------重置控制图片位置
    function reset(){
        playerMovementImage.x = originX;
        playerMovementImage.y = originY;
    }

}

