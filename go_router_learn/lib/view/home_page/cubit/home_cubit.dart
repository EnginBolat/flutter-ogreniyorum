import 'package:bloc/bloc.dart';
import 'package:go_router_learn/init/service/dio_service.dart';
import 'package:go_router_learn/init/service/i_dio_service.dart';
import 'package:go_router_learn/view/home_page/model/home_page_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  IDioService dioService = DioSercvice();

  Future fetchData() async {
    try {
      emit(HomeLoading());
      List<HomePageModel>? list = await dioService.fetchPost();
      emit(HomeFetch(list));
    } catch (e) {
      emit(HomeError("Cannot Fetch Data"));
    }
  }
}
