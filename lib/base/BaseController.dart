import 'package:comfy_dating/base/BaseModel.dart';
import 'package:get/get.dart';

abstract class BaseController<T extends BaseModel> extends FullLifeCycleController with FullLifeCycleMixin{
  late final T model;

  T initModel();

  @override
  void onInit() {
    super.onInit();
    model = initModel();
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