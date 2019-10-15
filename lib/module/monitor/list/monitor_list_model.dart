import 'package:common_utils/common_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pollution_source/module/common/common_model.dart';

//监控点
class Monitor extends Equatable {
  final String enterMonitorName;
  final String monitorName;
  final String monitorAddress;
  final String monitorType;
  final String imagePath;
  final String areaName;

  //标签集合
  final List<Label> labelList;

  Monitor({
    this.enterMonitorName = '',
    this.monitorName = '',
    this.monitorAddress = '',
    this.monitorType = '',
    this.imagePath = '',
    this.areaName = '',
    this.labelList,
  }) : super([
          enterMonitorName,
          monitorName,
          monitorAddress,
          monitorType,
          imagePath,
          areaName,
          labelList,
        ]);

  static Monitor fromJson(dynamic json) {
    /*return Monitor(
      enterMonitorName: json['disoutshortname'],
      monitorName: json['disoutname'],
      monitorAddress: json['disoutaddress'],
      monitorType: json['disouttype'],
      area: '没有该字段',
      imagePath: _getMonitorTypeImage(json['disouttype']),
      labelList: TextUtil.isEmpty('流量 PH 化学需氧量 氨氮 总磷 总氮') ? [] : _getLabelList('流量 PH 化学需氧量 氨氮 总磷 总氮'),
    );*/
    return Monitor(
      enterMonitorName: '江西大唐国际新余发电有限责任公司',
      monitorName: '废水排放口',
      monitorAddress: '深圳市南山区高新区高新南一路飞亚达大厦5-10楼',
      monitorType: '废水排口',
      areaName: '南昌市 市辖区',
      imagePath: _getMonitorTypeImage('outletType2'),
      labelList: TextUtil.isEmpty('流量 PH 化学需氧量 氨氮 总磷 总氮')
          ? []
          : _getLabelList('流量 PH 化学需氧量 氨氮 总磷 总氮'),
    );
  }

  //根据监控点类型获取图片
  static String _getMonitorTypeImage(String monitorType) {
    switch (monitorType) {
      case 'outletType1':
        //雨水
        return 'assets/images/icon_unknown_monitor.png';
      case 'outletType2':
        //废水
        return 'assets/images/icon_water_monitor.png';
      case 'outletType3':
        //废气
        return 'assets/images/icon_air_monitor.png';
      default:
        //未知
        return 'assets/images/icon_unknown_monitor.png';
    }
  }

  //将因子string转化成List
  static List<Label> _getLabelList(String string) {
    return string.trimLeft().trimRight().split(' ').map((string) {
      return Label(
        name: string,
        /*color: () {
          //获取随机颜色
          return Color.fromARGB(255, Random.secure().nextInt(255),
              Random.secure().nextInt(255), Random.secure().nextInt(255));
        }(),*/
        color: Colors.green,
      );
    }).toList();
  }
}