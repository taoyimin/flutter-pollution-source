import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:pollution_source/module/common/common_model.dart';
import 'package:pollution_source/module/common/common_widget.dart';
import 'package:pollution_source/module/index/admin/index_page.dart';
import 'package:pollution_source/res/colors.dart';
import 'package:pollution_source/res/gaps.dart';
import 'package:pollution_source/route/application.dart';
import 'package:pollution_source/route/routes.dart';
import 'package:pollution_source/widget/indicator.dart';
import 'package:pollution_source/widget/space_header.dart';

class OperationIndexPage extends StatefulWidget {
  OperationIndexPage({Key key}) : super(key: key);

  @override
  _OperationIndexPageState createState() => _OperationIndexPageState();
}

class _OperationIndexPageState extends State<OperationIndexPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: EasyRefresh.custom(
        header: SpaceHeader(),
        firstRefresh: false,
        firstRefreshWidget: Gaps.empty,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                AqiStatisticsWidget(),
                RoutineInspectionStatisticsWidget(
                  metaList: [
                    Meta(
                      title: '待巡检任务数',
                      imagePath: 'assets/images/button_bg_blue.png',
                      content: '52',
                    ),
                    Meta(
                      title: '超期任务数',
                      imagePath: 'assets/images/button_bg_green.png',
                      content: '13',
                    ),
                    Meta(
                      title: '已巡检任务数',
                      imagePath: 'assets/images/button_bg_pink.png',
                      content: '25',
                    ),
                  ],
                ),
                PollutionEnterStatisticsWidget(
                  metaList: [
                    Meta(
                      title: '企业总数',
                      imagePath: 'assets/images/icon_pollution_all_enter.png',
                      color: Color.fromRGBO(77, 167, 248, 1),
                      content: '245',
                    ),
                    Meta(
                      title: '重点企业',
                      imagePath: 'assets/images/icon_pollution_point_enter.png',
                      color: Color.fromRGBO(241, 190, 67, 1),
                      content: '125',
                    ),
                    Meta(
                      title: '在线企业',
                      imagePath:
                          'assets/images/icon_pollution_online_enter.png',
                      color: Color.fromRGBO(136, 191, 89, 1),
                      content: '223',
                    ),
                    Meta(
                      title: '废水企业',
                      imagePath: 'assets/images/icon_pollution_water_enter.png',
                      color: Color.fromRGBO(0, 188, 212, 1),
                      content: '45',
                    ),
                    Meta(
                      title: '废气企业',
                      imagePath: 'assets/images/icon_pollution_air_enter.png',
                      color: Color.fromRGBO(255, 87, 34, 1),
                      content: '65',
                    ),
                    Meta(
                      title: '水气企业',
                      imagePath: 'assets/images/icon_pollution_air_water.png',
                      color: Color.fromRGBO(137, 137, 137, 1),
                      content: '63',
                    ),
                    Meta(
                      title: '废水排口',
                      imagePath:
                          'assets/images/icon_pollution_water_outlet.png',
                      color: Color.fromRGBO(63, 81, 181, 1),
                      content: '42',
                    ),
                    Meta(
                      title: '废气排口',
                      imagePath: 'assets/images/icon_pollution_air_outlet.png',
                      color: Color.fromRGBO(233, 30, 99, 1),
                      content: '63',
                    ),
                    Meta(
                      title: '许可证企业',
                      imagePath:
                          'assets/images/icon_pollution_licence_enter.png',
                      color: Color.fromRGBO(179, 129, 127, 1),
                      content: '0',
                    ),
                  ],
                ),
                PieChartSample2(),
                OnlineMonitorStatisticsWidget(metaList: [
                  Meta(
                    title: '全部',
                    imagePath: 'assets/images/icon_monitor_all.png',
                    color: Color.fromRGBO(77, 167, 248, 1),
                    content: '12',
                  ),
                  Meta(
                    title: '在线',
                    imagePath: 'assets/images/icon_monitor_online.png',
                    color: Color.fromRGBO(136, 191, 89, 1),
                    content: '11',
                  ),
                  Meta(
                    title: '预警',
                    imagePath: 'assets/images/icon_monitor_alarm.png',
                    color: Color.fromRGBO(241, 190, 67, 1),
                    content: '0',
                  ),
                  Meta(
                    title: '超标',
                    imagePath: 'assets/images/icon_monitor_over.png',
                    color: Color.fromRGBO(233, 119, 111, 1),
                    content: '0',
                  ),
                  Meta(
                    title: '脱机',
                    imagePath: 'assets/images/icon_monitor_offline.png',
                    color: Color.fromRGBO(179, 129, 127, 1),
                    content: '0',
                  ),
                  Meta(
                    title: '异常',
                    imagePath: 'assets/images/icon_monitor_stop.png',
                    color: Color.fromRGBO(137, 137, 137, 1),
                    content: '1',
                  ),
                ]),
                OrderStatisticsWidget(
                  metaList: [
                    Meta(
                      title: '待处理数',
                      imagePath: 'assets/images/button_image2.png',
                      backgroundPath: 'assets/images/button_bg_lightblue.png',
                      content: '52',
                    ),
                    Meta(
                      title: '超期待办数',
                      imagePath: 'assets/images/button_image1.png',
                      backgroundPath: 'assets/images/button_bg_green.png',
                      content: '13',
                    ),
                    Meta(
                      title: '已退回数',
                      imagePath: 'assets/images/button_image4.png',
                      backgroundPath: 'assets/images/button_bg_pink.png',
                      content: '25',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        onRefresh: () async {
          //_indexBloc.add(Load());
          await Future.delayed(Duration(seconds: 2));
          return _refreshCompleter.future;
        },
      ),
    );
  }
}

class AqiStatisticsWidget extends StatelessWidget {
  AqiStatisticsWidget({Key key}) : super(key: key);

  Widget _getAqiStatisticsRowItem(factorName, factorValue) {
    return Expanded(
      flex: 1, //设置一个宽度，防止宽度不同无法对齐
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            factorValue,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
          Text(
            factorName,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/index_header_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            right: 0,
            bottom: 20,
            child: Image.asset(
              "assets/images/test123.png",
              height: 100,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                height: 80,
                padding: const EdgeInsets.fromLTRB(16, 35, 16, 0),
                //color: Colours.accent_color,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 30,
                      height: 30,
                      padding: const EdgeInsets.all(5),
                      child: Image(
                          image:
                              AssetImage("assets/images/index_location.png")),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      '欢迎！admin',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        '1',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '10',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.fromLTRB(5, 1, 5, 1),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(3), //3像素圆角
                          ),
                          child: Text(
                            '1',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Text(
                          '2',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        _getAqiStatisticsRowItem(
                          "PM2.5",
                          '3',
                        ),
                        VerticalDividerWidget(
                          height: 26,
                          width: 1,
                          color: Colors.white,
                        ),
                        _getAqiStatisticsRowItem(
                          "PM10",
                          '3',
                        ),
                        VerticalDividerWidget(
                          height: 26,
                          width: 1,
                          color: Colors.white,
                        ),
                        _getAqiStatisticsRowItem(
                          "SO₂",
                          '4',
                        ),
                        VerticalDividerWidget(
                          height: 26,
                          width: 1,
                          color: Colors.white,
                        ),
                        _getAqiStatisticsRowItem(
                          "NO₂",
                          '5',
                        ),
                        VerticalDividerWidget(
                          height: 26,
                          width: 1,
                          color: Colors.white,
                        ),
                        _getAqiStatisticsRowItem(
                          "O₃",
                          '6',
                        ),
                        VerticalDividerWidget(
                          height: 26,
                          width: 1,
                          color: Colors.white,
                        ),
                        _getAqiStatisticsRowItem(
                          "CO",
                          '6',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 常规巡检概况
class RoutineInspectionStatisticsWidget extends StatelessWidget {
  final List<Meta> metaList;

  RoutineInspectionStatisticsWidget({Key key, this.metaList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          TitleWidget(title: "常规巡检概况"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // 待巡检任务数
              InkWellButton2(
                meta: metaList[0],
                onTap: () {
                  Application.router.navigateTo(
                      context, '${Routes.routineInspectionList}?state=1');
                },
              ),
              Gaps.hGap6,
              // 超期任务数
              InkWellButton2(
                meta: metaList[1],
                onTap: () {
                  Application.router.navigateTo(
                      context, '${Routes.routineInspectionList}?state=2');
                },
              ),
              Gaps.hGap6,
              // 已巡检任务数
              InkWellButton2(
                meta: metaList[2],
                onTap: () {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('暂不支持查询已巡检任务'),
                      action: SnackBarAction(
                          label: '我知道了',
                          textColor: Colours.primary_color,
                          onPressed: () {}),
                    ),
                  );
                },
              ),
            ],
          ),
          RoutineInspectionTabViewWidget(),
        ],
      ),
    );
  }
}

class RoutineInspectionTabViewWidget extends StatefulWidget {
  @override
  _RoutineInspectionTabViewWidgetState createState() =>
      _RoutineInspectionTabViewWidgetState();
}

class _RoutineInspectionTabViewWidgetState
    extends State<RoutineInspectionTabViewWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TabBar(
          indicatorColor: Colours.primary_color,
          labelColor: Colours.primary_color,
          unselectedLabelColor: Colours.primary_color.withOpacity(0.5),
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: '离我最近',
            ),
            Tab(
              text: '即将截止',
            ),
          ],
        ),
        Container(
          height: 200,
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Container(
                color: Colors.green,
                child: Text('111'),
              ),
              Container(
                height: 100,
                width: 200,
                child: Text('222'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// 在线监控点概况
class OnlineMonitorStatisticsWidget extends StatelessWidget {
  final List<Meta> metaList;

  OnlineMonitorStatisticsWidget({Key key, this.metaList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: <Widget>[
          TitleWidget(title: "在线监控点概况"),
          Row(
            children: <Widget>[
              //全部
              InkWellButton1(
                ratio: 1.15,
                meta: metaList[0],
                onTap: () {
                  Application.router
                      .navigateTo(context, '${Routes.monitorList}?state=0');
                },
              ),
              VerticalDividerWidget(height: 40),
              //在线
              InkWellButton1(
                ratio: 1.15,
                meta: metaList[1],
                onTap: () {
                  Application.router
                      .navigateTo(context, '${Routes.monitorList}?state=1');
                },
              ),
              VerticalDividerWidget(height: 40),
              //预警
              InkWellButton1(
                ratio: 1.15,
                meta: metaList[2],
                onTap: () {
                  Application.router
                      .navigateTo(context, '${Routes.monitorList}?state=2');
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              //超标
              InkWellButton1(
                ratio: 1.15,
                meta: metaList[3],
                onTap: () {
                  Application.router
                      .navigateTo(context, '${Routes.monitorList}?state=3');
                },
              ),
              VerticalDividerWidget(height: 40),
              //脱机
              InkWellButton1(
                ratio: 1.15,
                meta: metaList[4],
                onTap: () {
                  Application.router
                      .navigateTo(context, '${Routes.monitorList}?state=4');
                },
              ),
              VerticalDividerWidget(height: 40),
              //异常
              InkWellButton1(
                ratio: 1.15,
                meta: metaList[5],
                onTap: () {
                  Application.router
                      .navigateTo(context, '${Routes.monitorList}?state=5');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 督办单统计
class OrderStatisticsWidget extends StatelessWidget {
  final List<Meta> metaList;

  OrderStatisticsWidget({Key key, this.metaList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          TitleWidget(title: "报警管理单概况"),
          Row(
            children: <Widget>[
              // 督办单待处理数
              InkWellButton3(
                meta: metaList[0],
                onTap: () {
                  Application.router.navigateTo(
                      context, '${Routes.orderList}?state=2');
                },
              ),
              Gaps.hGap10,
              // 督办单超期待办数
              InkWellButton3(
                meta: metaList[1],
                onTap: () {
                  Application.router.navigateTo(
                      context, '${Routes.orderList}?state=2&overdue=1');
                },
              ),
              Gaps.hGap10,
              // 督办单已退回数
              InkWellButton3(
                meta: metaList[2],
                onTap: () {
                  Application.router.navigateTo(
                      context, '${Routes.orderList}?state=4');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 污染源企业概况
class PollutionEnterStatisticsWidget extends StatelessWidget {
  final List<Meta> metaList;

  PollutionEnterStatisticsWidget({Key key, this.metaList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: <Widget>[
          TitleWidget(title: "污染源企业概况"),
          Row(
            children: <Widget>[
              //全部企业
              InkWellButton1(
                meta: metaList[0],
                onTap: () {
                  Application.router.navigateTo(context, '${Routes.enterList}');
                },
              ),
              VerticalDividerWidget(height: 30),
              //重点企业
              InkWellButton1(
                meta: metaList[1],
                onTap: () {
                  Application.router.navigateTo(
                      context, '${Routes.enterList}?attentionLevel=1');
                },
              ),
              VerticalDividerWidget(height: 30),
              //在线企业
              InkWellButton1(
                meta: metaList[2],
                onTap: () {
                  Application.router
                      .navigateTo(context, '${Routes.enterList}?state=1');
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              //废水企业
              InkWellButton1(
                meta: metaList[3],
                onTap: () {
                  Application.router.navigateTo(
                      context, '${Routes.enterList}?enterType=2');
                },
              ),
              VerticalDividerWidget(height: 30),
              //废气企业
              InkWellButton1(
                meta: metaList[4],
                onTap: () {
                  Application.router.navigateTo(
                      context, '${Routes.enterList}?enterType=3');
                },
              ),
              VerticalDividerWidget(height: 30),
              //水气企业
              InkWellButton1(
                meta: metaList[5],
                onTap: () {
                  Application.router.navigateTo(context,
                      '${Routes.enterList}?enterType=4');
                },
              ),
            ],
          ),
          Row(
            children: <Widget>[
              //废水排口
              InkWellButton1(
                meta: metaList[6],
                onTap: () {
                  Application.router.navigateTo(context,
                      '${Routes.dischargeList}?dischargeType=2');
                },
              ),
              VerticalDividerWidget(height: 30),
              //废气排口
              InkWellButton1(
                meta: metaList[7],
                onTap: () {
                  Application.router.navigateTo(context,
                      '${Routes.dischargeList}?dischargeType=3');
                },
              ),
              VerticalDividerWidget(height: 30),
              //许可证企业
              InkWellButton1(
                meta: metaList[8],
                onTap: () {
                  Application.router.navigateTo(
                      context, '${Routes.enterList}?enterType=5');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PieChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child:PieChart(
            PieChartData(
                pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                  setState(() {
                    if (pieTouchResponse.touchInput is FlLongPressEnd ||
                        pieTouchResponse.touchInput is FlPanEnd) {
                      touchedIndex = -1;
                    } else {
                      touchedIndex = pieTouchResponse.touchedSectionIndex;
                    }
                  });
                }),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                sections: showingSections()),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Indicator(
              color: Color(0xff0293ee),
              text: 'First',
              isSquare: true,
            ),
            SizedBox(
              height: 4,
            ),
            Indicator(
              color: Color(0xfff8b250),
              text: 'Second',
              isSquare: true,
            ),
            SizedBox(
              height: 4,
            ),
            Indicator(
              color: Color(0xff845bef),
              text: 'Third',
              isSquare: true,
            ),
            SizedBox(
              height: 4,
            ),
            Indicator(
              color: Color(0xff13d38e),
              text: 'Fourth',
              isSquare: true,
            ),
            SizedBox(
              height: 18,
            ),
          ],
        ),
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 80 : 70;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}
