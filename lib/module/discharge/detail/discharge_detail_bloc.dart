import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:pollution_source/http/dio_utils.dart';
import 'package:pollution_source/http/http.dart';
import 'package:pollution_source/module/common/common_model.dart';
import 'package:pollution_source/res/constant.dart';
import 'package:meta/meta.dart';

import 'discharge_detail.dart';

class DischargeDetailBloc extends Bloc<DischargeDetailEvent, DischargeDetailState> {
  @override
  DischargeDetailState get initialState => DischargeDetailLoading();

  @override
  Stream<DischargeDetailState> mapEventToState(DischargeDetailEvent event) async* {
    if (event is DischargeDetailLoad) {
      //加载排口详情
      yield* _mapDischargeDetailLoadToState(event);
    }
  }

  Stream<DischargeDetailState> _mapDischargeDetailLoadToState(
      DischargeDetailLoad event) async* {
    try {
      final dischargeDetail = await _getDischargeDetail(dischargeId: event.dischargeId);
      yield DischargeDetailLoaded(dischargeDetail: dischargeDetail);
    } catch (e) {
      yield DischargeDetailError(
          errorMessage: ExceptionHandle.handleException(e).msg);
    }
  }

  //获取排口详情
  Future<DischargeDetail> _getDischargeDetail({@required dischargeId}) async {
    if(SpUtil.getBool(Constant.spJavaApi, defValue: true)){
      Response response = await DioUtils.instance.getDio().get(
        HttpApi.dischargeDetail,
        queryParameters: {'dischargeId': dischargeId},
      );
      return DischargeDetail.fromJson(response.data[Constant.responseDataKey]);
    }else{
      Response response = await DioUtils.instance.getDio().get(
        'discharges/$dischargeId',
      );
      return DischargeDetail.fromJson(response.data);
    }
  }
}
