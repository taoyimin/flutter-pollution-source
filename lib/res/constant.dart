import 'package:pollution_source/http/http_api.dart';

/// 常量类
class Constant {
  /// debug开关，上线需要关闭
  /// App运行在Release环境时，inProduction为true；
  /// 当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction =
      const bool.fromEnvironment("dart.vm.product");

  /// ****************app的一些默认配置***************
  /// 污染源系统是否默认使用java后台
  static const bool defaultUseJavaApi = true;

  /// 请求列表时默认页数
  static const int defaultCurrentPage = 1;

  /// 请求列表时默认每页数据量
  static const int defaultPageSize = 20;

  /// ****************网络请求用的key***************
  /// Java接口header中token的key
  static const String requestHeaderTokenKey = 'token';

  /// Python接口header中token的key
  static const String requestHeaderAuthorizationKey = 'Authorization';

  /// 运维登录接口中取token的key
  static const String requestHeaderauthorizationKey = 'authorization';

  /// ****************解析接口数据用的key***************
  /// 解析返回数据用的key
  static const String responseCodeKey = 'code';
  static const String responseMessageKey = 'message';
  static const String responseMsgKey = 'msg';
  static const String responseSuccessKey = 'success';
  static const String responseDataKey = 'data';
  static const String responseIdKey = 'id';
  static const String responseEnterIdKey = 'enterId';

  /// 解析list用的key
  static const String responseListKey = 'list';
  static const String responseTotalKey = 'total';
  static const String responsePageSizeKey = 'pageSize';

  /// 解析python后台返回的list用这个key
  static const String responseCurrentPageKey = 'currentPage';
  static const String responseHasNextKey = 'hasNext';

  /// 解析java后台返回的list用这个key
  static const String responsePageNumKey = 'pageNum';
  static const String responseHasNextPageKey = 'hasNextPage';

  /// 解析运维后台返回的list用这个key
  static const String responseRecordsTotalKey = 'recordsTotal';
  static const String responseStartKey = 'start';
  static const String responseLengthKey = 'length';

  /// 解析返回数据中token用的key
  static const String responseTokenKey = 'token';

  /// 解析返回数据中realName用的key
  static const String responseRealNameKey = 'realName';

  /// 解析返回数据中attentionLevel用的key
  static const String responseAttentionLevelKey = 'attentionLevel';

  /// *********SharedPreferences存取数据用的key*********
  /// 存取登录用户名的key
  //static const String spUsername = 'username';

  /// 存取登录密码的key
  //static const String spPassword = 'password';

  /// 登录接口集合
  static const List<HttpApi> loginApis = [
    HttpApi.adminToken,
    HttpApi.enterToken,
    HttpApi.operationToken
  ];

  /// 是否开启debug模式
  static const String spDebug = 'debug';

  /// 存取环保用户登录用户名的key
  static const String spAdminUsername = 'adminUsername';

  /// 存取环保用户登录密码的key
  static const String spAdminPassword = 'adminPassword';

  /// 存取企业用户登录用户名的key
  static const String spEnterUsername = 'enterUsername';

  /// 存取企业用户登录密码的key
  static const String spEnterPassword = 'enterPassword';

  /// 存取运维用户登录用户名的key
  static const String spOperationUsername = 'operationUsername';

  /// 存取运维用户登录密码的key
  static const String spOperationPassword = 'operationPassword';

  /// 当前登陆用户的真实姓名
  static const String spRealName = 'realName';

  /// 当前登录用户的关注程度
  static const String spAttentionLevel = 'attentionLevel';

  /// 登录时间
  static const String spLoginTime = 'loginTime';

  /// 登录用户名key集合
  static const List<String> spUsernameList = [
    Constant.spAdminUsername,
    Constant.spEnterUsername,
    Constant.spOperationUsername
  ];

  /// 登录密码key集合
  static const List<String> spPasswordList = [
    Constant.spAdminPassword,
    Constant.spEnterPassword,
    Constant.spOperationPassword
  ];

  /// 存取登录用户类型的key
  static const String spUserType = 'userType';

  /// 存取登录用户token的key
  static const String spToken = 'token';

  /// 存取在线数据图表是否为曲线的key
  static const String spIsCurved = 'isCurved';

  /// 存取在线数据图表是否显示数据点的key
  static const String spShowDotData = 'showDotData';

  /// 存取污染源系统是否使用java后台的key
  static const String spUseJavaApi = 'useJavaApi';

  /// *********环保用户首页取数据用的key*********
  /// aqi统计
  static const String aqiStatisticsKey = '10';

  /// pm2.5考核
  static const String pm25ExamineKey = '20';

  /// api考核
  static const String aqiExamineKey = '21';

  /// 国控断面地表水统计
  static const String stateWaterKey = '30';

  /// 省控断面地表水统计
  static const String provinceWaterKey = '31';

  /// 市控断面地表水统计
  static const String countyWaterKey = '32';

  /// 饮用水断面地表水统计
  static const String waterWaterKey = '33';

  /// 金属断面地表水统计
  static const String metalWaterKey = '34';

  /// 污染源企业概况
  static const String pollutionEnterStatisticsKey = '40';

  /// 雨水企业概况
  static const String rainEnterStatisticsKey = '50';

  /// 综合统计信息
  static const String comprehensiveStatisticsKey = '60';

  /// 在线监控点概况
  static const String onlineMonitorStatisticsKey = '70';

  /// 报警管理单统计
  static const String todoTaskStatisticsKey = '90';

  /// 异常申报统计
  static const String reportStatisticsKey = '100';
}

const Map<String, String> provincesData = {
  "110000": "北京市",
  "120000": "天津市",
  "130000": "河北省",
  "140000": "山西省",
  "150000": "内蒙古自治区",
  "210000": "辽宁省",
  "220000": "吉林省",
  "230000": "黑龙江省",
  "310000": "上海市",
  "320000": "江苏省",
  "330000": "浙江省",
  "340000": "安徽省",
  "350000": "福建省",
  "360000": "江西省",
  "370000": "山东省",
  "410000": "河南省",
  "420000": "湖北省",
  "430000": "湖南省",
  "440000": "广东省",
  "450000": "广西壮族自治区",
  "460000": "海南省",
  "500000": "重庆市",
  "510000": "四川省",
  "520000": "贵州省",
  "530000": "云南省",
  "540000": "西藏自治区",
  "610000": "陕西省",
  "620000": "甘肃省",
  "630000": "青海省",
  "640000": "宁夏回族自治区",
  "650000": "新疆维吾尔自治区",
  "710000": "台湾省",
  "810000": "香港特别行政区",
  "820000": "澳门特别行政区"
};

const Map<String, dynamic> citiesData = {
  "110000": {
    "110100": {"name": "北京城区", "alpha": "b"}
  },
  "110100": {
    "110101": {"name": "东城区", "alpha": "d"},
    "110102": {"name": "西城区", "alpha": "x"},
    "110105": {"name": "朝阳区", "alpha": "c"},
    "110106": {"name": "丰台区", "alpha": "f"},
    "110107": {"name": "石景山区", "alpha": "s"},
    "110108": {"name": "海淀区", "alpha": "h"},
    "110109": {"name": "门头沟区", "alpha": "m"},
    "110111": {"name": "房山区", "alpha": "f"},
    "110112": {"name": "通州区", "alpha": "t"},
    "110113": {"name": "顺义区", "alpha": "s"},
    "110114": {"name": "昌平区", "alpha": "c"},
    "110115": {"name": "大兴区", "alpha": "d"},
    "110116": {"name": "怀柔区", "alpha": "h"},
    "110117": {"name": "平谷区", "alpha": "p"},
    "110118": {"name": "密云区", "alpha": "m"},
    "110119": {"name": "延庆区", "alpha": "y"}
  },
  "120000": {
    "120100": {"name": "天津城区", "alpha": "t"}
  },
  "120100": {
    "120101": {"name": "和平区", "alpha": "h"},
    "120102": {"name": "河东区", "alpha": "h"},
    "120103": {"name": "河西区", "alpha": "h"},
    "120104": {"name": "南开区", "alpha": "n"},
    "120105": {"name": "河北区", "alpha": "h"},
    "120106": {"name": "红桥区", "alpha": "h"},
    "120110": {"name": "东丽区", "alpha": "d"},
    "120111": {"name": "西青区", "alpha": "x"},
    "120112": {"name": "津南区", "alpha": "j"},
    "120113": {"name": "北辰区", "alpha": "b"},
    "120114": {"name": "武清区", "alpha": "w"},
    "120115": {"name": "宝坻区", "alpha": "b"},
    "120116": {"name": "滨海新区", "alpha": "b"},
    "120117": {"name": "宁河区", "alpha": "n"},
    "120118": {"name": "静海区", "alpha": "j"},
    "120119": {"name": "蓟州区", "alpha": "j"}
  },
  "130000": {
    "130100": {"name": "石家庄市", "alpha": "s"},
    "130200": {"name": "唐山市", "alpha": "t"},
    "130300": {"name": "秦皇岛市", "alpha": "q"},
    "130400": {"name": "邯郸市", "alpha": "h"},
    "130500": {"name": "邢台市", "alpha": "x"},
    "130600": {"name": "保定市", "alpha": "b"},
    "130700": {"name": "张家口市", "alpha": "z"},
    "130800": {"name": "承德市", "alpha": "c"},
    "130900": {"name": "沧州市", "alpha": "c"},
    "131000": {"name": "廊坊市", "alpha": "l"},
    "131100": {"name": "衡水市", "alpha": "h"}
  },
  "130100": {
    "130102": {"name": "长安区", "alpha": "c"},
    "130104": {"name": "桥西区", "alpha": "q"},
    "130105": {"name": "新华区", "alpha": "x"},
    "130107": {"name": "井陉矿区", "alpha": "j"},
    "130108": {"name": "裕华区", "alpha": "y"},
    "130109": {"name": "藁城区", "alpha": "g"},
    "130110": {"name": "鹿泉区", "alpha": "l"},
    "130111": {"name": "栾城区", "alpha": "l"},
    "130121": {"name": "井陉县", "alpha": "j"},
    "130123": {"name": "正定县", "alpha": "z"},
    "130125": {"name": "行唐县", "alpha": "x"},
    "130126": {"name": "灵寿县", "alpha": "l"},
    "130127": {"name": "高邑县", "alpha": "g"},
    "130128": {"name": "深泽县", "alpha": "s"},
    "130129": {"name": "赞皇县", "alpha": "z"},
    "130130": {"name": "无极县", "alpha": "w"},
    "130131": {"name": "平山县", "alpha": "p"},
    "130132": {"name": "元氏县", "alpha": "y"},
    "130133": {"name": "赵县", "alpha": "z"},
    "130171": {"name": "石家庄高新技术产业开发区", "alpha": "s"},
    "130172": {"name": "石家庄循环化工园区", "alpha": "s"},
    "130181": {"name": "辛集市", "alpha": "x"},
    "130183": {"name": "晋州市", "alpha": "j"},
    "130184": {"name": "新乐市", "alpha": "x"}
  },
  "130200": {
    "130202": {"name": "路南区", "alpha": "l"},
    "130203": {"name": "路北区", "alpha": "l"},
    "130204": {"name": "古冶区", "alpha": "g"},
    "130205": {"name": "开平区", "alpha": "k"},
    "130207": {"name": "丰南区", "alpha": "f"},
    "130208": {"name": "丰润区", "alpha": "f"},
    "130209": {"name": "曹妃甸区", "alpha": "c"},
    "130224": {"name": "滦南县", "alpha": "l"},
    "130225": {"name": "乐亭县", "alpha": "l"},
    "130227": {"name": "迁西县", "alpha": "q"},
    "130229": {"name": "玉田县", "alpha": "y"},
    "130271": {"name": "唐山市芦台经济技术开发区", "alpha": "t"},
    "130272": {"name": "唐山市汉沽管理区", "alpha": "t"},
    "130273": {"name": "唐山高新技术产业开发区", "alpha": "t"},
    "130274": {"name": "河北唐山海港经济开发区", "alpha": "h"},
    "130281": {"name": "遵化市", "alpha": "z"},
    "130283": {"name": "迁安市", "alpha": "q"},
    "130284": {"name": "滦州市", "alpha": "l"}
  },
  "130300": {
    "130302": {"name": "海港区", "alpha": "h"},
    "130303": {"name": "山海关区", "alpha": "s"},
    "130304": {"name": "北戴河区", "alpha": "b"},
    "130306": {"name": "抚宁区", "alpha": "f"},
    "130321": {"name": "青龙满族自治县", "alpha": "q"},
    "130322": {"name": "昌黎县", "alpha": "c"},
    "130324": {"name": "卢龙县", "alpha": "l"},
    "130371": {"name": "秦皇岛市经济技术开发区", "alpha": "q"},
    "130372": {"name": "北戴河新区", "alpha": "b"}
  },
  "130400": {
    "130402": {"name": "邯山区", "alpha": "h"},
    "130403": {"name": "丛台区", "alpha": "c"},
    "130404": {"name": "复兴区", "alpha": "f"},
    "130406": {"name": "峰峰矿区", "alpha": "f"},
    "130407": {"name": "肥乡区", "alpha": "f"},
    "130408": {"name": "永年区", "alpha": "y"},
    "130423": {"name": "临漳县", "alpha": "l"},
    "130424": {"name": "成安县", "alpha": "c"},
    "130425": {"name": "大名县", "alpha": "d"},
    "130426": {"name": "涉县", "alpha": "s"},
    "130427": {"name": "磁县", "alpha": "c"},
    "130430": {"name": "邱县", "alpha": "q"},
    "130431": {"name": "鸡泽县", "alpha": "j"},
    "130432": {"name": "广平县", "alpha": "g"},
    "130433": {"name": "馆陶县", "alpha": "g"},
    "130434": {"name": "魏县", "alpha": "w"},
    "130435": {"name": "曲周县", "alpha": "q"},
    "130471": {"name": "邯郸经济技术开发区", "alpha": "h"},
    "130473": {"name": "邯郸冀南新区", "alpha": "h"},
    "130481": {"name": "武安市", "alpha": "w"}
  },
  "130500": {
    "130502": {"name": "桥东区", "alpha": "q"},
    "130503": {"name": "桥西区", "alpha": "q"},
    "130521": {"name": "邢台县", "alpha": "x"},
    "130522": {"name": "临城县", "alpha": "l"},
    "130523": {"name": "内丘县", "alpha": "n"},
    "130524": {"name": "柏乡县", "alpha": "b"},
    "130525": {"name": "隆尧县", "alpha": "l"},
    "130526": {"name": "任县", "alpha": "r"},
    "130527": {"name": "南和县", "alpha": "n"},
    "130528": {"name": "宁晋县", "alpha": "n"},
    "130529": {"name": "巨鹿县", "alpha": "j"},
    "130530": {"name": "新河县", "alpha": "x"},
    "130531": {"name": "广宗县", "alpha": "g"},
    "130532": {"name": "平乡县", "alpha": "p"},
    "130533": {"name": "威县", "alpha": "w"},
    "130534": {"name": "清河县", "alpha": "q"},
    "130535": {"name": "临西县", "alpha": "l"},
    "130571": {"name": "河北邢台经济开发区", "alpha": "h"},
    "130581": {"name": "南宫市", "alpha": "n"},
    "130582": {"name": "沙河市", "alpha": "s"}
  },
  "130600": {
    "130602": {"name": "竞秀区", "alpha": "j"},
    "130606": {"name": "莲池区", "alpha": "l"},
    "130607": {"name": "满城区", "alpha": "m"},
    "130608": {"name": "清苑区", "alpha": "q"},
    "130609": {"name": "徐水区", "alpha": "x"},
    "130623": {"name": "涞水县", "alpha": "l"},
    "130624": {"name": "阜平县", "alpha": "f"},
    "130626": {"name": "定兴县", "alpha": "d"},
    "130627": {"name": "唐县", "alpha": "t"},
    "130628": {"name": "高阳县", "alpha": "g"},
    "130629": {"name": "容城县", "alpha": "r"},
    "130630": {"name": "涞源县", "alpha": "l"},
    "130631": {"name": "望都县", "alpha": "w"},
    "130632": {"name": "安新县", "alpha": "a"},
    "130633": {"name": "易县", "alpha": "y"},
    "130634": {"name": "曲阳县", "alpha": "q"},
    "130635": {"name": "蠡县", "alpha": "l"},
    "130636": {"name": "顺平县", "alpha": "s"},
    "130637": {"name": "博野县", "alpha": "b"},
    "130638": {"name": "雄县", "alpha": "x"},
    "130671": {"name": "保定高新技术产业开发区", "alpha": "b"},
    "130672": {"name": "保定白沟新城", "alpha": "b"},
    "130681": {"name": "涿州市", "alpha": "z"},
    "130682": {"name": "定州市", "alpha": "d"},
    "130683": {"name": "安国市", "alpha": "a"},
    "130684": {"name": "高碑店市", "alpha": "g"}
  },
  "130700": {
    "130702": {"name": "桥东区", "alpha": "q"},
    "130703": {"name": "桥西区", "alpha": "q"},
    "130705": {"name": "宣化区", "alpha": "x"},
    "130706": {"name": "下花园区", "alpha": "x"},
    "130708": {"name": "万全区", "alpha": "w"},
    "130709": {"name": "崇礼区", "alpha": "c"},
    "130722": {"name": "张北县", "alpha": "z"},
    "130723": {"name": "康保县", "alpha": "k"},
    "130724": {"name": "沽源县", "alpha": "g"},
    "130725": {"name": "尚义县", "alpha": "s"},
    "130726": {"name": "蔚县", "alpha": "y"},
    "130727": {"name": "阳原县", "alpha": "y"},
    "130728": {"name": "怀安县", "alpha": "h"},
    "130730": {"name": "怀来县", "alpha": "h"},
    "130731": {"name": "涿鹿县", "alpha": "z"},
    "130732": {"name": "赤城县", "alpha": "c"},
    "130771": {"name": "张家口市高新技术产业开发区", "alpha": "z"},
    "130772": {"name": "张家口市察北管理区", "alpha": "z"},
    "130773": {"name": "张家口市塞北管理区", "alpha": "z"}
  },
  "130800": {
    "130802": {"name": "双桥区", "alpha": "s"},
    "130803": {"name": "双滦区", "alpha": "s"},
    "130804": {"name": "鹰手营子矿区", "alpha": "y"},
    "130821": {"name": "承德县", "alpha": "c"},
    "130822": {"name": "兴隆县", "alpha": "x"},
    "130824": {"name": "滦平县", "alpha": "l"},
    "130825": {"name": "隆化县", "alpha": "l"},
    "130826": {"name": "丰宁满族自治县", "alpha": "f"},
    "130827": {"name": "宽城满族自治县", "alpha": "k"},
    "130828": {"name": "围场满族蒙古族自治县", "alpha": "w"},
    "130871": {"name": "承德高新技术产业开发区", "alpha": "c"},
    "130881": {"name": "平泉市", "alpha": "p"}
  },
  "130900": {
    "130902": {"name": "新华区", "alpha": "x"},
    "130903": {"name": "运河区", "alpha": "y"},
    "130921": {"name": "沧县", "alpha": "c"},
    "130922": {"name": "青县", "alpha": "q"},
    "130923": {"name": "东光县", "alpha": "d"},
    "130924": {"name": "海兴县", "alpha": "h"},
    "130925": {"name": "盐山县", "alpha": "y"},
    "130926": {"name": "肃宁县", "alpha": "s"},
    "130927": {"name": "南皮县", "alpha": "n"},
    "130928": {"name": "吴桥县", "alpha": "w"},
    "130929": {"name": "献县", "alpha": "x"},
    "130930": {"name": "孟村回族自治县", "alpha": "m"},
    "130971": {"name": "河北沧州经济开发区", "alpha": "h"},
    "130972": {"name": "沧州高新技术产业开发区", "alpha": "c"},
    "130973": {"name": "沧州渤海新区", "alpha": "c"},
    "130981": {"name": "泊头市", "alpha": "b"},
    "130982": {"name": "任丘市", "alpha": "r"},
    "130983": {"name": "黄骅市", "alpha": "h"},
    "130984": {"name": "河间市", "alpha": "h"}
  },
  "131000": {
    "131002": {"name": "安次区", "alpha": "a"},
    "131003": {"name": "广阳区", "alpha": "g"},
    "131022": {"name": "固安县", "alpha": "g"},
    "131023": {"name": "永清县", "alpha": "y"},
    "131024": {"name": "香河县", "alpha": "x"},
    "131025": {"name": "大城县", "alpha": "d"},
    "131026": {"name": "文安县", "alpha": "w"},
    "131028": {"name": "大厂回族自治县", "alpha": "d"},
    "131071": {"name": "廊坊经济技术开发区", "alpha": "l"},
    "131081": {"name": "霸州市", "alpha": "b"},
    "131082": {"name": "三河市", "alpha": "s"}
  },
  "131100": {
    "131102": {"name": "桃城区", "alpha": "t"},
    "131103": {"name": "冀州区", "alpha": "j"},
    "131121": {"name": "枣强县", "alpha": "z"},
    "131122": {"name": "武邑县", "alpha": "w"},
    "131123": {"name": "武强县", "alpha": "w"},
    "131124": {"name": "饶阳县", "alpha": "r"},
    "131125": {"name": "安平县", "alpha": "a"},
    "131126": {"name": "故城县", "alpha": "g"},
    "131127": {"name": "景县", "alpha": "j"},
    "131128": {"name": "阜城县", "alpha": "f"},
    "131171": {"name": "河北衡水高新技术产业开发区", "alpha": "h"},
    "131172": {"name": "衡水滨湖新区", "alpha": "h"},
    "131182": {"name": "深州市", "alpha": "s"}
  },
  "140000": {
    "140100": {"name": "太原市", "alpha": "t"},
    "140200": {"name": "大同市", "alpha": "d"},
    "140300": {"name": "阳泉市", "alpha": "y"},
    "140400": {"name": "长治市", "alpha": "c"},
    "140500": {"name": "晋城市", "alpha": "j"},
    "140600": {"name": "朔州市", "alpha": "s"},
    "140700": {"name": "晋中市", "alpha": "j"},
    "140800": {"name": "运城市", "alpha": "y"},
    "140900": {"name": "忻州市", "alpha": "x"},
    "141000": {"name": "临汾市", "alpha": "l"},
    "141100": {"name": "吕梁市", "alpha": "l"}
  },
  "140100": {
    "140105": {"name": "小店区", "alpha": "x"},
    "140106": {"name": "迎泽区", "alpha": "y"},
    "140107": {"name": "杏花岭区", "alpha": "x"},
    "140108": {"name": "尖草坪区", "alpha": "j"},
    "140109": {"name": "万柏林区", "alpha": "w"},
    "140110": {"name": "晋源区", "alpha": "j"},
    "140121": {"name": "清徐县", "alpha": "q"},
    "140122": {"name": "阳曲县", "alpha": "y"},
    "140123": {"name": "娄烦县", "alpha": "l"},
    "140171": {"name": "山西转型综合改革示范区", "alpha": "s"},
    "140181": {"name": "古交市", "alpha": "g"}
  },
};
