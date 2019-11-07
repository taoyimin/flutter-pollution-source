import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:pollution_source/module/report/factor/detail/factor_report_detail_bloc.dart';
import 'package:pollution_source/module/report/factor/detail/factor_report_detail_page.dart';
import 'package:pollution_source/res/gaps.dart';
import 'package:pollution_source/util/ui_utils.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart'
    as extended;
import 'package:pollution_source/module/common/common_widget.dart';
import 'package:pollution_source/widget/custom_header.dart';

import 'factor_report_list.dart';

class FactorReportListPage extends StatefulWidget {
  final String enterId;
  final String dischargeId;
  final String monitorId;
  final String state;

  FactorReportListPage({
    this.enterId = '',
    this.dischargeId = '',
    this.monitorId = '',
    this.state = '',
  });

  @override
  _FactorReportListPageState createState() =>
      _FactorReportListPageState();
}

class _FactorReportListPageState extends State<FactorReportListPage>
    with TickerProviderStateMixin {
  ScrollController _scrollController;
  FactorReportListBloc _reportListBloc;
  EasyRefreshController _refreshController;
  TextEditingController _editController;
  Completer<void> _refreshCompleter;
  String areaCode = '';

  @override
  void initState() {
    super.initState();
    _reportListBloc = BlocProvider.of<FactorReportListBloc>(context);
    _refreshController = EasyRefreshController();
    _refreshCompleter = Completer<void>();
    _scrollController = ScrollController();
    _editController = TextEditingController();
    //首次加载
    _reportListBloc.add(FactorReportListLoad(
      enterId: widget.enterId,
      dischargeId: widget.dischargeId,
      monitorId: widget.monitorId,
      state: widget.state,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _refreshController.dispose();
    _editController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: extended.NestedScrollView(
        controller: _scrollController,
        pinnedHeaderSliverHeightBuilder: () {
          return MediaQuery.of(context).padding.top + kToolbarHeight;
        },
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            ListHeaderWidget(
              title: '因子异常申报列表',
              subtitle: '展示因子异常申报列表，点击列表项查看该因子异常申报的详细信息',
              background: 'assets/images/button_bg_pink.png',
              image: 'assets/images/report_list_bg_image.png',
              color: Colors.pink,
              showSearch: true,
              editController: _editController,
              scrollController: _scrollController,
              onSearchPressed: () => _refreshController.callRefresh(),
              areaPickerListener: (areaId) {
                areaCode = areaId;
              },
              popupMenuButton: PopupMenuButton<String>(
                itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  UIUtils.getSelectView(Icons.message, '发起群聊', 'A'),
                  UIUtils.getSelectView(Icons.group_add, '添加服务', 'B'),
                  UIUtils.getSelectView(Icons.cast_connected, '扫一扫码', 'C'),
                ],
                onSelected: (String action) {
                  // 点击选项的时候
                  switch (action) {
                    case 'A':
                      break;
                    case 'B':
                      break;
                    case 'C':
                      break;
                  }
                },
              ),
            ),
          ];
        },
        body: extended.NestedScrollViewInnerScrollPositionKeyWidget(
          Key('list'),
          EasyRefresh.custom(
            controller: _refreshController,
            header: UIUtils.getRefreshClassicalHeader(),
            footer: UIUtils.getLoadClassicalFooter(),
            slivers: <Widget>[
              BlocListener<FactorReportListBloc, FactorReportListState>(
                listener: (context, state) {
                  _refreshCompleter?.complete();
                  _refreshCompleter = Completer();
                },
                child: BlocBuilder<FactorReportListBloc, FactorReportListState>(
                  builder: (context, state) {
                    if (state is FactorReportListLoading) {
                      return PageLoadingWidget();
                    } else if (state is FactorReportListEmpty) {
                      return PageEmptyWidget();
                    } else if (state is FactorReportListError) {
                      return PageErrorWidget(errorMessage: state.errorMessage);
                    } else if (state is FactorReportListLoaded) {
                      if (!state.hasNextPage)
                        _refreshController.finishLoad(
                            noMore: !state.hasNextPage, success: true);
                      return _buildPageLoadedList(state.reportList);
                    } else {
                      return PageErrorWidget(errorMessage: 'BlocBuilder监听到未知的的状态');
                    }
                  },
                ),
              ),
            ],
            onRefresh: () async {
              //刷新事件
              _reportListBloc.add(FactorReportListLoad(
                isRefresh: true,
                enterName: _editController.text,
                areaCode: areaCode,
                enterId: widget.enterId,
                dischargeId: widget.dischargeId,
                monitorId: widget.monitorId,
                state: widget.state,
              ));
              return _refreshCompleter.future;
            },
            onLoad: () async {
              //加载事件
              _reportListBloc.add(FactorReportListLoad(
                enterName: _editController.text,
                areaCode: areaCode,
                enterId: widget.enterId,
                dischargeId: widget.dischargeId,
                monitorId: widget.monitorId,
                state: widget.state,
              ));
              return _refreshCompleter.future;
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPageLoadedList(List<FactorReport> reportList) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          //创建列表项
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: InkWellButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider(
                        builder: (context) => FactorReportDetailBloc(),
                        child: FactorReportDetailPage(
                          reportId: reportList[index].reportId,
                        ),
                      );
                    },
                  ),
                );
              },
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      UIUtils.getBoxShadow(),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${reportList[index].enterName}',
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Gaps.vGap6,
                      LabelWrapWidget(labelList: reportList[index].labelList),
                      reportList[index].labelList.length == 0
                          ? Gaps.empty
                          : Gaps.vGap6,
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: ListTileWidget(
                                '监控点名：${reportList[index].monitorName}'),
                          ),
                          Expanded(
                            flex: 1,
                            child: ListTileWidget(
                                '所属区域：${reportList[index].districtName}'),
                          ),
                        ],
                      ),
                      Gaps.vGap6,
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: ListTileWidget(
                                '报警类型：${reportList[index].alarmTypeStr}'),
                          ),
                          Expanded(
                            flex: 1,
                            child: ListTileWidget(
                                '开始时间：${reportList[index].startTimeStr}'),
                          ),

                        ],
                      ),
                      Gaps.vGap6,
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: ListTileWidget(
                                '申报时间：${reportList[index].reportTimeStr}'),
                          ),
                          Expanded(
                            flex: 1,
                            child: ListTileWidget(
                                '结束时间：${reportList[index].endTimeStr}'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        childCount: reportList.length,
      ),
    );
  }
}
