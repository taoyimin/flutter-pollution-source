import 'package:equatable/equatable.dart';

abstract class DischargeListEvent extends Equatable {
  const DischargeListEvent();

  @override
  List<Object> get props => [];
}

class DischargeListLoad extends DischargeListEvent {
  //是否刷新
  final bool isRefresh;

  //按企业名称搜索
  final String enterName;

  //按区域搜索
  final String areaCode;

  //企业ID
  final String enterId;

  const DischargeListLoad({
    this.isRefresh = false,
    this.enterName = '',
    this.areaCode = '',
    this.enterId = '',
  });

  @override
  List<Object> get props => [
        isRefresh,
        enterName,
        areaCode,
        enterId,
      ];
}
