pragma Singleton
import QtQuick 2.0
import Felgo 3.0

QtObject {
  id: gameInfo

  // statistic
  // 静态的
    property int remainLife: 3
  property bool gameOver: false           // indicates a gameover and shows gameovermessage
    //指示gameover并显示gameovermessage
  property bool gamePaused: true          // freezes the animations, the controls, the opponent and the powerup spawn
    //冻结动画、控件、对手和通电衍生
                                          // in the beginning while countdown is running and at the gameOver window
    //在开始倒计时时处于游戏结束界面
  // powerUps
//  property int powerUpCount: 0
//  property int maxPowerUpsOnField: 4
//  property int speed: 2                   // for the accelerator powerup, doubles the tank speed
//    //加速时，坦克速度加倍
//  property int shieldDamageReduction: 65  // percentage of damage reduction when you have the shield powerup
//    //防护罩通电时减少伤害的百分比

  // menu layout
  // 菜单布局
  property int border: 2
  property int radius: 7
  property double lighterColor: 1.7       // lighter colors are 70% lighter than normal colors
    // 较浅的颜色比正常颜色轻70%
  property double opacity: 0.3            // opacity for movement control, shot and energy bar
    // 运动控制、镜头和能量条的不透明度

  // energy management
  // 能源管理
//  property int maxEnergy: 100
//  property int fillEnergy: 25             // extra energy powerup //额外能量通电
//  property int normalDamage: 18           // tank, opponent, obstacle //坦克、对手、障碍物
//  property int powerDamage: 36            // with PowerUp // 通电后

  // controller parameters
  // 控制器参数
  readonly property double maximumPlayerVelocity: 2
  property real damping: 10
}
