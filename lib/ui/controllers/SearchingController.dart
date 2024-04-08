import 'package:comfy_dating/base/BaseController.dart';
import 'package:comfy_dating/base/BaseModel.dart';
import 'package:get/get.dart';

class SearchingController extends BaseController<BaseModel> {
  static SearchingController get to => Get.find();

  var isSearching = false.obs;

  @override
  BaseModel initModel() => BaseModel();
}