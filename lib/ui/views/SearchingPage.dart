import 'package:comfy_dating/ui/controllers/HomeController.dart';
import 'package:comfy_dating/ui/controllers/SearchingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchingController());
  }
}

class SearchingPage extends GetView<SearchingController>{
  @override
  Widget build(context) {
    return TextButton(onPressed: (){
      HomeController.to.go("/home/search");
    }, child: Text("test"));
  }
}