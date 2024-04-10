import 'package:comfy_dating/base/BaseController.dart';
import 'package:comfy_dating/base/BaseModel.dart';
import 'package:comfy_dating/ui/views/MemberPage.dart';
import 'package:comfy_dating/ui/views/MessagePage.dart';
import 'package:comfy_dating/ui/views/SearchingPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends BaseController<BaseModel> {
  static HomeController get to => Get.find();

  var selectedIndex = 0.obs;
  var canPop = false.obs;

  List<String> titles = ["search".tr, "message".tr, "member".tr];

  @override
  BaseModel initModel() => BaseModel();

  void go(String routeName, {
      bool offAll = false,
      dynamic arguments
  }){
    if(offAll){
      Get.offAllNamed(routeName, id: selectedIndex.value, arguments: arguments);
    }else {
      Get.toNamed(routeName, id: selectedIndex.value, arguments: arguments);
    }
    _updateCanPop();
  }

  // ------------------------------
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
        return GetPageRoute(page: () => SearchingPage(), binding: SearchingBinding(), settings: settings, transitionDuration: Duration.zero);
      case "/home/message":
        return GetPageRoute(page: () => MessagePage(), binding: MessageBinding(), settings: settings, transitionDuration: Duration.zero);
      case "/home/member":
        return GetPageRoute(page: () => MemberPage(), binding: MemberBinding(), settings: settings, transitionDuration: Duration.zero);
      default:
        return null;
    }
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