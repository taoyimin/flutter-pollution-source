import 'package:common_utils/common_utils.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:pollution_source/module/common/common_model.dart';
import 'package:pollution_source/module/common/common_widget.dart';
import 'package:pollution_source/module/common/detail/detail_bloc.dart';
import 'package:pollution_source/module/common/detail/detail_event.dart';
import 'package:pollution_source/module/common/detail/detail_state.dart';
import 'package:pollution_source/module/enter/detail/enter_detail_model.dart';
import 'package:pollution_source/res/colors.dart';
import 'package:pollution_source/res/constant.dart';
import 'package:pollution_source/res/gaps.dart';
import 'package:pollution_source/route/routes.dart';
import 'package:pollution_source/util/ui_utils.dart';
import 'package:pollution_source/widget/custom_header.dart';

class EnterDetailPage extends StatefulWidget {
  final String enterId;

  EnterDetailPage({@required this.enterId}) : assert(enterId != null);

  @override
  _EnterDetailPageState createState() => _EnterDetailPageState();
}

class _EnterDetailPageState extends State<EnterDetailPage> {
  DetailBloc _detailBloc;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _detailBloc = BlocProvider.of<DetailBloc>(context);
    _detailBloc.add(DetailLoad(detailId: widget.enterId));
  }

  @override
  void dispose() {
    //取消正在进行的请求
    final currentState = _detailBloc?.state;
    if (currentState is DetailLoading) currentState.cancelToken?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: EasyRefresh.custom(
        slivers: <Widget>[
          BlocBuilder<DetailBloc, DetailState>(
            builder: (context, state) {
              String enterName = '';
              String enterAddress = '';
              if (state is DetailLoaded) {
                enterName = state.detail.enterName ?? '';
                enterAddress = state.detail.enterAddress ?? '';
              }
              return DetailHeaderWidget(
                title: '企业详情',
                subTitle1: '$enterName',
                subTitle2: '$enterAddress',
                imagePath: 'assets/images/enter_detail_bg_image.svg',
                backgroundPath: 'assets/images/button_bg_lightblue.png',
                color: Colours.background_light_blue,
              );
            },
          ),
          //生成body
          BlocBuilder<DetailBloc, DetailState>(
            builder: (context, state) {
              if (state is DetailLoading) {
                return LoadingSliver();
              } else if (state is DetailError) {
                return ErrorSliver(errorMessage: state.message);
              } else if (state is DetailLoaded) {
                return _buildPageLoadedDetail(state.detail);
              } else {
                return ErrorSliver(
                    errorMessage: 'BlocBuilder监听到未知的的状态!state=$state');
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPageLoadedDetail(EnterDetail enterDetail) {
    return SliverToBoxAdapter(
      child: Column(
        children: <Widget>[
          //基本信息
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ImageTitleWidget(
                  title: '基本信息',
                  imagePath: 'assets/images/icon_enter_baseinfo.png',
                ),
                Gaps.vGap10,
                Row(
                  children: <Widget>[
                    IconBaseInfoWidget(
                      content: '关注程度：${enterDetail.attentionLevelStr ?? ''}',
                      icon: Icons.star,
                      flex: 4,
                    ),
                    Gaps.hGap10,
                    IconBaseInfoWidget(
                      content: '所属区域：${enterDetail.districtName ?? ''}',
                      icon: Icons.location_on,
                      flex: 5,
                    ),
                  ],
                ),
                Gaps.vGap10,
                Row(
                  children: <Widget>[
                    IconBaseInfoWidget(
                      content: '行业类别：${enterDetail.industryTypeStr ?? ''}',
                      icon: Icons.work,
                    ),
                  ],
                ),
                Gaps.vGap10,
                Row(
                  children: <Widget>[
                    IconBaseInfoWidget(
                      content: '信用代码：${enterDetail.creditCode ?? ''}',
                      icon: Icons.mail,
                    ),
                  ],
                ),
              ],
            ),
          ),
          //联系人 没有联系人则隐藏
          Offstage(
            offstage: TextUtil.isEmpty(enterDetail.enterTel) &&
                TextUtil.isEmpty(enterDetail.contactPersonTel) &&
                TextUtil.isEmpty(enterDetail.legalPersonTel),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ImageTitleWidget(
                    title: '企业联系人',
                    imagePath: 'assets/images/icon_enter_contacts.png',
                  ),
                  Offstage(
                    offstage: TextUtil.isEmpty(enterDetail.enterTel),
                    child: ContactsWidget(
                      contactsName: '企业电话',
                      contactsTel: '${enterDetail.enterTel}',
                      imagePath: 'assets/images/enter_enter_tel_header.png',
                    ),
                  ),
                  Offstage(
                    offstage: TextUtil.isEmpty(enterDetail.contactPersonTel),
                    child: ContactsWidget(
                      contactsName: '${enterDetail.contactPerson ?? ''}(联系人)',
                      contactsTel: '${enterDetail.contactPersonTel}',
                      imagePath: 'assets/images/enter_contacts_tel_header.png',
                    ),
                  ),
                  Offstage(
                    offstage: TextUtil.isEmpty(enterDetail.legalPersonTel),
                    child: ContactsWidget(
                      contactsName: '${enterDetail.legalPerson ?? ''}(法人)',
                      contactsTel: '${enterDetail.legalPersonTel}',
                      imagePath: 'assets/images/enter_legal_tel_header.png',
                    ),
                  ),
                ],
              ),
            ),
          ),
          //报警管理单
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ImageTitleWidget(
                  title: '报警管理单',
                  imagePath: 'assets/images/icon_alarm_manage.png',
                ),
                Gaps.vGap10,
                Row(
                  children: <Widget>[
                    InkWellButton5(
                      ratio: 1.2,
                      meta: Meta(
                        color: Color(0xFF45C4FF),
                        title: '已办结',
                        content: '${enterDetail.orderCompleteCount}',
                        imagePath:
                            'assets/images/icon_alarm_manage_complete.png',
                        router:
                            '${Routes.orderList}?enterId=${widget.enterId}&state=5',
                      ),
                    ),
                    Gaps.hGap10,
                    InkWellButton5(
                      ratio: 1.2,
                      meta: Meta(
                        color: Color(0xFFFFB709),
                        title: '全部',
                        content: '${enterDetail.orderTotalCount}',
                        imagePath: 'assets/images/icon_alarm_manage_all.png',
                        router: '${Routes.orderList}?enterId=${widget.enterId}',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //异常申报信息
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ImageTitleWidget(
                  title: '异常申报(有效数)',
                  imagePath: 'assets/images/icon_outlet_report.png',
                ),
                Gaps.vGap10,
                Row(
                  children: <Widget>[
                    InkWellButton3(
                      onTap: SpUtil.getInt(Constant.spUserType) == 2
                          ? () {
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                  content: Text('运维用户不支持查询长期停产'),
                                  action: SnackBarAction(
                                    label: '我知道了',
                                    onPressed: () {},
                                  ),
                                ),
                              );
                            }
                          : null,
                      meta: Meta(
                        title: '长期停产申报',
                        content: '${enterDetail.longStopReportTotalCount}',
                        imagePath: 'assets/images/button_image2.png',
                        backgroundPath: 'assets/images/button_bg_lightblue.png',
                        router:
                            '${Routes.longStopReportList}?enterId=${enterDetail.enterId}&valid=0',
                      ),
                    ),
                    Gaps.hGap10,
                    InkWellButton3(
                      titleFontSize: 13,
                      meta: Meta(
                        title: '排口异常申报',
                        content: '${enterDetail.dischargeReportTotalCount}',
                        imagePath: 'assets/images/button_image1.png',
                        backgroundPath: 'assets/images/button_bg_green.png',
                        router:
                            '${Routes.dischargeReportList}?enterId=${enterDetail.enterId}&valid=0',
                      ),
                    ),
                    Gaps.hGap10,
                    InkWellButton3(
                      meta: Meta(
                        title: '因子异常申报',
                        content: '${enterDetail.factorReportTotalCount}',
                        imagePath: 'assets/images/button_image4.png',
                        backgroundPath: 'assets/images/button_bg_pink.png',
                        router:
                            '${Routes.factorReportList}?enterId=${enterDetail.enterId}&valid=0',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //监控点信息
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ImageTitleWidget(
                  title: '监控点信息',
                  imagePath: 'assets/images/icon_monitor_info.png',
                ),
                Gaps.vGap10,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      UIUtils.getBoxShadow(),
                    ],
                  ),
                  child: OnlineMonitorStatisticsGrid(
                    metaList: [
                      Meta(
                        title: '全部',
                        imagePath: 'assets/images/icon_monitor_all.png',
                        color: Color.fromRGBO(77, 167, 248, 1),
                        content: '${enterDetail.monitorTotalCount}',
                        router:
                            '${Routes.monitorList}?enterId=${enterDetail.enterId}',
                      ),
                      Meta(
                        title: '在线',
                        imagePath: 'assets/images/icon_monitor_online.png',
                        color: Color.fromRGBO(136, 191, 89, 1),
                        content: '${enterDetail.monitorOnlineCount}',
                        router:
                            '${Routes.monitorList}?enterId=${enterDetail.enterId}&state=1',
                      ),
                      Meta(
                        title: '预警',
                        imagePath: 'assets/images/icon_monitor_alarm.png',
                        color: Color.fromRGBO(241, 190, 67, 1),
                        content: '${enterDetail.monitorAlarmCount}',
                        router:
                            '${Routes.monitorList}?enterId=${enterDetail.enterId}&state=2',
                      ),
                      Meta(
                        title: '超标',
                        imagePath: 'assets/images/icon_monitor_over.png',
                        color: Color.fromRGBO(233, 119, 111, 1),
                        content: '${enterDetail.monitorOverCount}',
                        router:
                            '${Routes.monitorList}?enterId=${enterDetail.enterId}&state=3',
                      ),
                      Meta(
                        title: '负值',
                        imagePath:
                            'assets/images/icon_monitor_negative_value.png',
                        color: Color.fromRGBO(0, 188, 212, 1),
                        content: '${enterDetail.monitorNegativeCount}',
                        router:
                            '${Routes.monitorList}?enterId=${enterDetail.enterId}&state=4',
                      ),
                      Meta(
                        title: '超大值',
                        imagePath: 'assets/images/icon_monitor_large_value.png',
                        color: Color.fromRGBO(255, 87, 34, 1),
                        content: '${enterDetail.monitorLargeCount}',
                        router:
                            '${Routes.monitorList}?enterId=${enterDetail.enterId}&state=5',
                      ),
                      Meta(
                        title: '零值',
                        imagePath: 'assets/images/icon_monitor_zero_value.png',
                        color: Color.fromRGBO(106, 106, 255, 1),
                        content: '${enterDetail.monitorZeroCount}',
                        router:
                            '${Routes.monitorList}?enterId=${enterDetail.enterId}&state=6',
                      ),
                      Meta(
                        title: '脱机',
                        imagePath: 'assets/images/icon_monitor_offline.png',
                        color: Color.fromRGBO(179, 129, 127, 1),
                        content: '${enterDetail.monitorOfflineCount}',
                        router:
                            '${Routes.monitorList}?enterId=${enterDetail.enterId}&state=7',
                      ),
                      Meta(
                        title: '异常申报',
                        imagePath: 'assets/images/icon_monitor_stop.png',
                        color: Color.fromRGBO(137, 137, 137, 1),
                        content: '${enterDetail.monitorStopCount}',
                        router:
                            '${Routes.monitorList}?enterId=${enterDetail.enterId}&state=8',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //排污许可证信息
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ImageTitleWidget(
                  title: '排污许可证信息',
                  imagePath: 'assets/images/icon_discharge_permit.png',
                ),
                Gaps.vGap10,
                InkWellButton6(
                  meta: Meta(
                    title: '许可证编号',
                    content: '${enterDetail.licenseNumber ?? ''}',
                    color: Colours.background_red,
                    imagePath: 'assets/images/discharge_permit.png',
                    backgroundPath: 'assets/images/button_bg_red.png',
                    router: '${Routes.licenseList}?enterId=${enterDetail.enterId}',
                  ),
                ),
              ],
            ),
          ),
          //其他信息 赣州才有
          /*Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ImageTitleWidget(
                  title: '其他信息统计',
                  imagePath: 'assets/images/icon_enter_other_info.png',
                ),
                Gaps.vGap10,
                Row(
                  children: <Widget>[
                    //监察执法
                    InkWellButton3(
                      meta: Meta(
                        title: "建设项目",
                        content: '${enterDetail.buildProjectCount??''}',
                        backgroundPath: "assets/images/button_bg_lightblue.png",
                        imagePath: "assets/images/button_image2.png",
                      ),
                      onTap: () {},
                    ),
                    Gaps.hGap10,
                    //项目审批
                    InkWellButton3(
                      meta: Meta(
                        title: "现场执法",
                        content: '${enterDetail.sceneLawCount??''}',
                        backgroundPath: "assets/images/button_bg_red.png",
                        imagePath: "assets/images/button_image1.png",
                      ),
                      onTap: () {},
                    ),
                    Gaps.hGap10,
                    //信访投诉
                    InkWellButton3(
                      meta: Meta(
                        title: '环境信访',
                        content: '${enterDetail.environmentVisitCount??''}',
                        backgroundPath: "assets/images/button_bg_yellow.png",
                        imagePath: "assets/images/button_image3.png",
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
