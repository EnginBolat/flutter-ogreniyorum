import 'package:go_router_learn/view/details_page/model/details_page_model.dart';
import 'package:go_router_learn/view/home_page/model/home_page_model.dart';

abstract class IDioService {
  Future<List<HomePageModel>?> fetchPost();
  Future<DetailsPageModel?> fetchDetails(String id);
}
