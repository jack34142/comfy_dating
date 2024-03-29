import 'package:comfy_dating/ui/controllers/MemberController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MemberController());
  }
}

class MemberPage extends GetView<MemberController>{
  @override
  Widget build(context) {
    return Text("member");
  }
}