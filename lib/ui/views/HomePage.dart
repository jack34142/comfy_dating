import 'package:comfy_dating/ui/controllers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class HomePage extends GetView<HomeController>{
  @override
  Widget build(context) {
    return Obx(() => Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop){
          controller.onBackPress();
        },
        child: IndexedStack(
          index: controller.selectedIndex.value,
          children: [
            Navigator(
              key: Get.nestedKey(0),
              initialRoute: '/home/search',
              onGenerateRoute: controller.onRouteGenerate,
            ),
            Navigator(
              key: Get.nestedKey(1),
              initialRoute: '/home/message',
              onGenerateRoute: controller.onRouteGenerate,
            ),
            Navigator(
              key: Get.nestedKey(2),
              initialRoute: '/home/member',
              onGenerateRoute: controller.onRouteGenerate,
            ),
          ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(  // https://gist.github.com/eduardoflorence/11c0a4db3cba9d50ba72a0c6c262df40
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "search".tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "message".tr,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "member".tr,
          ),
        ],
        currentIndex: controller.selectedIndex.value,
        onTap: controller.onTabTab,
      ),
    ));
  }
}