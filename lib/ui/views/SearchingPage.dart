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
    return Obx(() => Column(
      children: [
        AppBar(
          title: Text("search".tr),
          leading: HomeController.to.canPop.value ? BackButton(
            onPressed: HomeController.to.onBackPress,
          ) : null,
          actions: [
            IconButton(
                icon: Icon(Icons.search),
                onPressed: controller.onSearchTap
            )
          ],
        ),
        Expanded(child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.red,
              child: TextButton(
                onPressed: () {
                  controller.showMsg("test");
                },
                child: Text("test"),
              ),
            ),
            // controller.searchType.value == 1 ? _buildAreaSelector() : Container()
          ],
        ))
      ],
    ));
  }

  // Widget _buildSearchOption(){
  //   debugPrint(controller.searchType.value.toString());
  //
  //   Widget child;
  //   switch(controller.searchType.value){
  //     case 1:
  //       child = _buildAreaSelector();
  //     default:
  //       return Container();
  //   }
  //
  //   return Container(
  //     margin: EdgeInsets.only(bottom: 100),
  //     decoration: BoxDecoration(
  //         color: Colors.blue,
  //         borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
  //     ),
  //     child: child,
  //   );
  // }

  // Widget _buildAreaSelector(){
  //   return SingleChildScrollView(child: Column(
  //     children: controller.twCountys.map((county) => StickyHeader(
  //       header: Text(county.name),
  //       content: ListView.builder(
  //         itemCount: county.districts.length,
  //         itemBuilder: (context, index) => Text(county.districts[index].name)
  //       )
  //     )).toList(),
  //   ));
  // }
}