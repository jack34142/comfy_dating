import 'package:comfy_dating/ui/controllers/HomeController.dart';
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
    return Obx(() => Column(
      children: [
        AppBar(
          title: Text("member".tr),
          leading: HomeController.to.canPop.value ? BackButton(
            onPressed: HomeController.to.onBackPress,
          ) : null,
        ),
        Expanded(child: Wrap(
          children: [
            TextButton(
              onPressed: () {
                HomeController.to.go("/home/message");
              },
              child: Text("next page"),
            ),
            TextButton(
              onPressed: (){
                controller.showMsg("消息測試");
              },
              child: Text("showMsg")
            ),
            TextButton(
                onPressed: (){
                  controller.showToast("toast測試");
                },
                child: Text("showToast")
            ),
            TextButton(
              onPressed: () {
                controller.showLoading();
                Future.delayed(const Duration(milliseconds: 1500), () {
                  controller.hideLoading();
                });
              },
              child: Text("showLoading"),
            )
          ],
        ))
      ],
    ));
  }
}