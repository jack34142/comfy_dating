import 'package:comfy_dating/base/BaseModel.dart';
import 'package:comfy_dating/ui/controllers/OverlayController.dart';
import 'package:comfy_dating/ui/templates/dialogs/MsgDialog.dart';
import 'package:get/get.dart';

abstract class BaseController<T extends BaseModel> extends FullLifeCycleController with FullLifeCycleMixin{
  late final T model;

  T initModel();

  @override
  void onInit() {
    super.onInit();
    model = initModel();
  }

  void showToast(String msg){
    OverlayController.to.showToast(msg);
  }

  void showMsg(String msg){
    Get.dialog(MsgDialog(msg));
  }

  @override
  void onDetached() {
    // debugPrint("onDetached");
  }

  @override
  void onHidden() {
    // debugPrint("onHidden");
  }

  @override
  void onInactive() {
    // debugPrint("onInactive");
  }

  @override
  void onPaused() {
    // debugPrint("onPaused");
  }

  @override
  void onResumed() {
    // debugPrint("onResumed");
  }
}