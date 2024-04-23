import 'package:comfy_dating/base/BaseController.dart';
import 'package:get/get.dart';

class OverlayController extends BaseController {
  static OverlayController get to => Get.find();

  final loadingCount = 0.obs;
  final isToast = false.obs;
  final toastString = "".obs;

  @override
  void showToast(String msg) {
    isToast.value = true;
    toastString.value = msg;

    Future.delayed(const Duration(milliseconds: 1500), () {
      isToast.value = false;
    });
  }

  @override
  void showLoading() {
    loadingCount.value++;
  }

  @override
  void hideLoading() {
    if(loadingCount.value > 0){
      loadingCount.value--;
    }
  }
}