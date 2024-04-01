import 'package:comfy_dating/base/BaseController.dart';
import 'package:comfy_dating/ui/models/HomeModel.dart';
import 'package:comfy_dating/ui/templates/dialogs/MsgDialog.dart';
import 'package:comfy_dating/ui/views/MemberPage.dart';
import 'package:comfy_dating/ui/views/MessagePage.dart';
import 'package:comfy_dating/ui/views/SearchingPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends BaseController<HomeModel> {
  static HomeController get to => Get.find();

  var selectedIndex = 0.obs;
  var canPop = false.obs;

  List<String> titles = ["search".tr, "message".tr, "member".tr];

  @override
  HomeModel initModel() => HomeModel();

  void go(String routeName){
    Get.toNamed(routeName, id: selectedIndex.value);
    _updateCanPop();
  }

  void onBackPress(){
    if( canPop.value ){
      Get.back(id: selectedIndex.value);
      _updateCanPop();
    }else{
      debugPrint("你在首頁了");
    }
  }

  Route? onRouteGenerate(RouteSettings settings) {
    switch(settings.name){
      case "/home/search":
        return GetPageRoute(page: () => SearchingPage(), binding: SearchingBinding(), settings: settings);
      case "/home/message":
        return GetPageRoute(page: () => MessagePage(), binding: MessageBinding(), settings: settings);
      case "/home/member":
        return GetPageRoute(page: () => MemberPage(), binding: MemberBinding(), settings: settings);
      default:
        return null;
    }
  }

  void showMsg(String msg){
    Get.dialog(
      MsgDialog(msg),
    );
  }

  // ------------------------------
  void _updateCanPop(){
    NavigatorState? state = Get.global(selectedIndex.value).currentState;
    if( state == null || !state.canPop() ){
      canPop.value = false;
    }else{
      canPop.value =  true;
    }
  }
}