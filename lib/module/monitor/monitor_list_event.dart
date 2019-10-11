import 'package:equatable/equatable.dart';

abstract class MonitorListEvent extends Equatable {
  MonitorListEvent([List props = const []]) : super(props);
}

class MonitorListLoad extends MonitorListEvent {
  //是否刷新
  final bool isRefresh;

  //按企业名称搜索
  final String enterName;

  //按区域搜索
  final String areaCode;

  //督办单状态
  final String status;

  MonitorListLoad({
    this.isRefresh = false,
    this.enterName = '',
    this.areaCode = '',
    this.status = '1',
  }) : super([
          isRefresh,
          enterName,
          areaCode,
          status,
        ]);

  @override
  String toString() => 'MonitorListLoad';
}
