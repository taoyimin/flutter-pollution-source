import 'dart:ui';

import 'package:flutter/material.dart';

class Water {
  Water(this.title, this.imagePath, this.count, this.achievementRate,
      this.monthOnMonth, this.yearOnYear);

  String title; //标题
  String imagePath; //图片路径
  int count; //数量
  double achievementRate; //达标率
  double monthOnMonth; //环比
  double yearOnYear; //同比
}

class Monitor {
  Monitor(this.title, this.count, this.imagePath, this.color);

  String title; //状态
  int count; //个数
  Color color; //图标颜色
  String imagePath; //图片路径
}

class AqiExamine {
  AqiExamine(this.title, this.imagePath, this.title1, this.value1, this.title2,
      this.value2, this.title3, this.value3);

  String title; //标题
  String imagePath; //图片路径
  String title1;
  String value1;
  String title2;
  String value2;
  String title3;
  String value3;
}

class PollutionEnter {
  PollutionEnter(this.title, this.count, this.imagePath, this.color);

  String title; //标题
  int count; //个数
  Color color; //图标颜色
  String imagePath; //图片路径
}

class SummaryStatistics {
  SummaryStatistics(
      this.title, this.count, this.color, this.imagePath, this.backgroundPath);

  String title; //标题
  int count; //个数
  Color color; //图标颜色
  String imagePath; //图片路径
  String backgroundPath; //背景路径
}

class Enter {
  Enter({
    @required this.name,
    @required this.address,
    @required this.isImportant,
    @required this.imagePath,
    @required this.industryType,
  });

  String name;
  String address;
  bool isImportant;
  String imagePath;
  String industryType;
}
