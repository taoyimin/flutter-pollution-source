import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:pollution_source/http/http.dart';
import 'package:pollution_source/module/common/detail/detail_event.dart';
import 'package:pollution_source/module/common/detail/detail_repository.dart';
import 'package:pollution_source/module/common/detail/detail_state.dart';
import 'package:meta/meta.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailRepository detailRepository;

  DetailBloc({@required this.detailRepository})
      : assert(detailRepository != null);

  @override
  DetailState get initialState => DetailLoading(cancelToken: null);

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if (event is DetailLoad) {
      yield* _mapReportDetailLoadToState(event);
    }
  }

  //处理加载详情事件
  Stream<DetailState> _mapReportDetailLoadToState(DetailLoad event) async* {
    try {
      CancelToken cancelToken = CancelToken();
      yield DetailLoading(cancelToken: cancelToken);
      final detail = await detailRepository.request(
          detailId: event.detailId, params: event.params, cancelToken: cancelToken);
      yield DetailLoaded(detail: detail);
    } catch (e) {
      yield DetailError(message: ExceptionHandle.handleException(e).msg);
    }
  }
}
