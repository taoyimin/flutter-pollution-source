import 'package:equatable/equatable.dart';
import 'package:flustars/flustars.dart';
import 'package:pollution_source/res/constant.dart';

//排口异常申报列表
class DischargeReport extends Equatable {
  final String reportId; //申报单ID
  final String enterName; //企业名称
  final String monitorName; //监控点名称
  final String stopTypeStr; //异常类型
  final String districtName; //区域
  final String startTimeStr; //开始时间
  final String endTimeStr; //结束时间
  final String reportTimeStr; //申报时间

  const DischargeReport({
    this.reportId,
    this.enterName,
    this.monitorName,
    this.stopTypeStr,
    this.districtName,
    this.startTimeStr,
    this.endTimeStr,
    this.reportTimeStr,
  });

  @override
  List<Object> get props => [
        reportId,
        enterName,
        monitorName,
        stopTypeStr,
        districtName,
        startTimeStr,
        endTimeStr,
        reportTimeStr,
      ];

  static DischargeReport fromJson(dynamic json) {
    if (SpUtil.getBool(Constant.spJavaApi, defValue: true)) {
      return DischargeReport(
        reportId: '-',
        enterName: '-',
        monitorName: '-',
        stopTypeStr: '-',
        districtName: '-',
        startTimeStr: '-',
        endTimeStr: '-',
        reportTimeStr: '-',
      );
    } else {
      return DischargeReport(
        reportId: json['reportId'],
        enterName: json['enterName'],
        monitorName: json['monitorName'],
        stopTypeStr: json['stopTypeStr'],
        districtName: json['districtName'],
        startTimeStr: json['startTimeStr'],
        endTimeStr: json['endTimeStr'],
        reportTimeStr: json['reportTimeStr'],
      );
    }
  }
}
