import 'package:equatable/equatable.dart';
import 'package:pollution_source/module/common/common_model.dart';

//异常申报单详情
class ReportDetail extends Equatable {
  final String enterName; //企业名称
  final String enterAddress;  //企业地址
  final String outletName;  //排口名称
  final String monitorName; //监控点名称
  final String areaName;  //区域
  final String reportTime;  //申报时间
  final String startTime; //开始时间
  final String endTime; //结束时间
  final String abnormalFactor;  //异常因子
  final String abnormalType;  //异常类型
  final String reportReason;  //申报原因
  final String reviewOpinion; //审核意见
  final List<Attachment> attachmentList;  //证明材料

  const ReportDetail({
    this.enterName,
    this.enterAddress,
    this.outletName,
    this.monitorName,
    this.areaName,
    this.reportTime,
    this.startTime,
    this.endTime,
    this.abnormalFactor,
    this.abnormalType,
    this.reportReason,
    this.reviewOpinion,
    this.attachmentList,
  });

  @override
  List<Object> get props => [
        enterName,
        enterAddress,
        outletName,
        monitorName,
        areaName,
        reportTime,
        startTime,
        endTime,
        abnormalFactor,
        abnormalType,
        reportReason,
        reviewOpinion,
        attachmentList,
      ];

  static ReportDetail fromJson(dynamic json) {
    return ReportDetail(
      enterName: '江西大唐国际新余发电有限责任公司',
      enterAddress: '深圳市南山区高新区高新南一路飞亚达大厦5-10楼',
      outletName: '废水排放排放口',
      monitorName: '废水排放排放口',
      areaName: '南昌市 市辖区',
      reportTime: '10月15日',
      startTime: '2019-10-14 10:10',
      endTime: '2019-10-16 12:22',
      abnormalFactor: '臭氧 二氧化硫',
      abnormalType: '排放流量异常',
      reportReason:
          '2号机组3：18点火，点火期间因氧量大造成烟尘、氮氧化物折算浓度小时均值虚高。7：02并网发电，8：45达到脱硝投运条件，投入2号脱硝系统运行，开机期间，氮氧化物小时均值超标2小时。',
      reviewOpinion: '',
      attachmentList: [
        Attachment(type: 0, fileName: "文件名文件名.png", url: "", size: "1.2M"),
        Attachment(type: 1, fileName: "文件名文件名文件名.doc", url: "", size: "56KB"),
        Attachment(
            type: 3, fileName: "文件文件名文件文件文件名.pdf", url: "", size: "4.3M"),
        Attachment(type: 5, fileName: "文件文件名文件文件名.psd", url: "", size: "412KB"),
      ],
    );
  }
}
