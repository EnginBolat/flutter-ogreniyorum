import 'package:bloc/bloc.dart';
import 'package:go_router_learn/init/service/dio_service.dart';
import 'package:go_router_learn/init/service/i_dio_service.dart';
import 'package:go_router_learn/view/details_page/model/details_page_model.dart';
import 'package:meta/meta.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());

  IDioService dioService = DioSercvice();

  Future fetchData(String id) async {
    try {
      emit(DetailsLoading());
      DetailsPageModel? item = await dioService.fetchDetails(id);
      emit(DetailsFetch(item));
    } catch (e) {
      emit(DetailsError("Cannot Fetch Data"));
    }
  }
}
