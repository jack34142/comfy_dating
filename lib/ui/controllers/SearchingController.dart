import 'package:comfy_dating/base/BaseController.dart';
import 'package:comfy_dating/ui/models/SearchingModel.dart';
import 'package:get/get.dart';

class SearchingController extends BaseController<SearchingModel> {
  static SearchingController get to => Get.find();

  var isSearching = false.obs;

  @override
  SearchingModel initModel() => SearchingModel();
}