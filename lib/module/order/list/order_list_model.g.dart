// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    orderId: json['id'] as int,
    enterName: json['enterpriseName'] as String ?? '',
    monitorName: json['disMonitorName'] as String ?? '',
    alarmDateStr: json['alarmDate'] as String ?? '',
    cityName: json['cityName'] as String ?? '',
    areaName: json['areaName'] as String ?? '',
    alarmStateStr: json['alarmStateStr'] as String ?? '',
    alarmDesc: json['alarmDesc'] as String ?? '',
    alarmTypeStr: json['alarmTypeStr'] as String ?? '',
    alarmCauseStr: json['alarmCauseStr'] as String ?? '',
    alarmLevel: json['alarmLevel'] as String ?? '',
    alarmLevelName: json['alarmLevelName'] as String ?? '',
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.orderId,
      'enterpriseName': instance.enterName,
      'disMonitorName': instance.monitorName,
      'alarmDate': instance.alarmDateStr,
      'cityName': instance.cityName,
      'areaName': instance.areaName,
      'alarmStateStr': instance.alarmStateStr,
      'alarmDesc': instance.alarmDesc,
      'alarmTypeStr': instance.alarmTypeStr,
      'alarmCauseStr': instance.alarmCauseStr,
      'alarmLevel': instance.alarmLevel,
      'alarmLevelName': instance.alarmLevelName,
    };
