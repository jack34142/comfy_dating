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
              leading: controller.canPop.value ? BackButton(
                onPressed: controller.onBackPress,
              ) : null,
              title: const Text("title")
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
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Member',
              ),
            ],
            selectedItemColor: Colors.pink,
            currentIndex: controller.selectedIndex.value,
            onTap: (index) => controller.selectedIndex.value = index,
          ),
        )
    ));
  }
}