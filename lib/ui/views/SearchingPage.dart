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
    return Stack(
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 100),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
          ),
        ),
      ],
    );
  }
}