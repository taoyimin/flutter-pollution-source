import 'package:flustars/flustars.dart';
import 'package:pollution_source/module/common/common_widget.dart';
import 'package:pollution_source/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:pollution_source/res/constant.dart';
import 'package:pollution_source/util/file_utils.dart';
import 'package:pollution_source/util/toast_utils.dart';
import 'package:pollution_source/util/ui_utils.dart';
import 'package:pollution_source/widget/wave.dart';

/// 个人中心页面
class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  final double _headerHeight = 300;
  final double _headerBgHeight = 230;
  final double _cardHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFFFEE5F),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Color(0xFFFAFAFA),
                  ),
                ),
              ],
            ),
          ),
          EasyRefresh.custom(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  // 顶部栏
                  Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: _headerHeight,
                        color: Color(0xFFFAFAFA),
                      ),
                      ClipPath(
                        clipper: TopBarClipper(
                            MediaQuery.of(context).size.width, _headerBgHeight),
                        child: Container(
                          height: _headerBgHeight,
                          width: double.infinity,
                          child: Image.asset(
                            "assets/images/mine_header_bg.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // 名字
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                        child: Center(
                          child: Text(
                            '${SpUtil.getString(Constant.spRealName)}',
                            style: TextStyle(
                              fontSize:
                                  '${SpUtil.getString(Constant.spRealName)}'
                                              .length <=
                                          12
                                      ? 25
                                      : 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 10,
                        left: 10,
                        child: ClipPath(
                          clipper: TopCardClipper(
                              MediaQuery.of(context).size.width,
                              _headerBgHeight),
                          child: Container(
                            height: _cardHeight,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                UIUtils.getBoxShadow(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 120,
                        left: 0,
                        right: 0,
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: 90,
                                width: 90,
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                      "assets/images/mine_user_header.png"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 30,
                        right: 10,
                        left: 10,
                        child: Container(
                          height: 80.0,
                          width: double.infinity,
                          child: Wave(
                            config: CustomConfig(
                              gradients: [
                                [Colors.red, Color(0xEEF44336)],
                                [Colors.red[800], Color(0x77E57373)],
                                [Colors.orange, Color(0x66FF9800)],
                                [Colors.yellow, Color(0x55FFEB3B)]
                              ],
                              durations: [35000, 19440, 10800, 6000],
                              heightPercentages: [0.20, 0.23, 0.25, 0.30],
                              blur: MaskFilter.blur(BlurStyle.inner, 16.0),
                              gradientBegin: Alignment.bottomLeft,
                              gradientEnd: Alignment.topRight,
                            ),
                            backgroundColor: Colors.transparent,
                            size: Size(double.infinity, double.infinity),
                            waveAmplitude: 0,
                          ),
                        ),
                      ),
//                      Positioned(
//                        bottom: 30,
//                        right: 10,
//                        left: 10,
//                        child: Container(
//                          height: 80,
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceAround,
//                            children: <Widget>[
//                              Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: <Widget>[
//                                  Text(
//                                    "18",
//                                    style: TextStyle(
//                                        fontSize: 30,
//                                        fontStyle: FontStyle.normal),
//                                  ),
//                                  Text(
//                                    "代办",
//                                    style: TextStyle(
//                                        fontSize: 13,
//                                        color: Colours.secondary_text),
//                                  ),
//                                ],
//                              ),
//                              Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: <Widget>[
//                                  Text(
//                                    "458",
//                                    style: TextStyle(
//                                        fontSize: 30,
//                                        fontStyle: FontStyle.normal),
//                                  ),
//                                  Text(
//                                    "代办",
//                                    style: TextStyle(
//                                        fontSize: 13,
//                                        color: Colours.secondary_text),
//                                  ),
//                                ],
//                              ),
//                              Column(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: <Widget>[
//                                  Text(
//                                    "69",
//                                    style: TextStyle(
//                                        fontSize: 30,
//                                        fontStyle: FontStyle.normal),
//                                  ),
//                                  Text(
//                                    "代办",
//                                    style: TextStyle(
//                                        fontSize: 13,
//                                        color: Colours.secondary_text),
//                                  ),
//                                ],
//                              ),
//                            ],
//                          ),
//                        ),
//                      ),
                      Positioned(
                        bottom: 140,
                        right: 50,
                        child: Image.asset(
                          "assets/images/icon_QR_code.png",
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
//                      Positioned(
//                        top: 36,
//                        left: 16,
//                        child: Icon(
//                          Icons.notifications_none,
//                          color: Colors.white,
//                        ),
//                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    color: Color(0xFFFAFAFA),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "常用功能",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              UIUtils.getBoxShadow(),
                            ],
                          ),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/images/icon_change_password.png",
                                        width: 30,
                                        height: 30,
                                      ),
                                      Text(
                                        "修改密码",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colours.secondary_text),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/images/icon_help_book.png",
                                        width: 30,
                                        height: 30,
                                      ),
                                      Text(
                                        "帮助手册",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colours.secondary_text),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/images/icon_share_product.png",
                                        width: 30,
                                        height: 30,
                                      ),
                                      Text(
                                        "分享产品",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colours.secondary_text),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/images/icon_feedback.png",
                                        width: 30,
                                        height: 30,
                                      ),
                                      Text(
                                        "问题反馈",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colours.secondary_text),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/images/icon_check_update.png",
                                        width: 30,
                                        height: 30,
                                      ),
                                      Text(
                                        "版本更新",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colours.secondary_text),
                                      ),
                                    ],
                                  ),
                                  InkWellButton(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text("清理缓存"),
                                              content: const Text("是否确定清理缓存？"),
                                              actions: <Widget>[
                                                FlatButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("取消"),
                                                ),
                                                FlatButton(
                                                  onPressed: () async {
                                                    await FileUtils
                                                        .clearApplicationDirectory();
                                                    Toast.show('清理附件成功！');
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text("确认"),
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            "assets/images/icon_clear_cache.png",
                                            width: 30,
                                            height: 30,
                                          ),
                                          Text(
                                            "清理缓存",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colours.secondary_text),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/images/icon_login_out.png",
                                        width: 30,
                                        height: 30,
                                      ),
                                      Text(
                                        "注销登录",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colours.secondary_text),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "                ",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colours.secondary_text),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 顶部栏裁剪
class TopBarClipper extends CustomClipper<Path> {
  // 宽高
  double width;
  double height;

  TopBarClipper(this.width, this.height);

  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(width, 0.0);
    path.lineTo(width, height / 2);
    path.lineTo(0.0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class TopCardClipper extends CustomClipper<Path> {
  // 宽高
  double width;
  double height;

  TopCardClipper(this.width, this.height);

  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.moveTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);
    path.lineTo(0, height / 2);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
