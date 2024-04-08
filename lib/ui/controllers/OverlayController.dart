import 'package:comfy_dating/base/BaseController.dart';
import 'package:comfy_dating/base/BaseModel.dart';
import 'package:get/get.dart';

class OverlayController extends BaseController<BaseModel> {
  static OverlayController get to => Get.find();

  final isToast = false.obs;
  final toastString = "".obs;

  @override
  BaseModel initModel() => BaseModel();

  @override
  void showToast(String msg) {
    isToast.value = true;
    toastString.value = msg;

    Future.delayed(const Duration(milliseconds: 1500), () {
      isToast.value = false;
    });
  }
}