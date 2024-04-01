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
    return Obx(() => PopScope(
        canPop: false,
        onPopInvoked: (didPop){
          controller.onBackPress();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(controller.titles[controller.selectedIndex.value]),
            leading: controller.canPop.value ? BackButton(
              onPressed: controller.onBackPress,
            ) : null,
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: (){
                  controller.showMsg("test");
                }
              )
            ],
          ),
          body: IndexedStack(
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
          ),
          bottomNavigationBar: BottomNavigationBar(  // https://gist.github.com/eduardoflorence/11c0a4db3cba9d50ba72a0c6c262df40
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: controller.titles[0],
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: controller.titles[1],
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: controller.titles[2],
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            onTap: (index) => controller.selectedIndex.value = index,
          ),
        )
    ));
  }
}