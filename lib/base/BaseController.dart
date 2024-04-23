import 'package:comfy_dating/ui/controllers/OverlayController.dart';
import 'package:comfy_dating/ui/templates/dialogs/MsgDialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController{
  void showMsg(String msg){
    Get.dialog(MsgDialog(msg));
  }

  void showLoading(){
    OverlayController.to.showLoading();
  }

  void hideLoading(){
    OverlayController.to.hideLoading();
  }

  void showToast(String msg){
    OverlayController.to.showToast(msg);
  }

  void onApiError(dynamic error){
    debugPrint(error.toString());
    showMsg(error.toString());
  }
}