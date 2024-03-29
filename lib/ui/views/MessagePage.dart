import 'package:comfy_dating/ui/controllers/MessageController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageController());
  }
}

class MessagePage extends GetView<MessageController>{
  @override
  Widget build(context) {
    return Text("message");
  }
}