import 'package:comfy_dating/configs/MyColors.dart';
import 'package:comfy_dating/configs/MyStyles.dart';
import 'package:comfy_dating/enums/Gender.dart';
import 'package:comfy_dating/http/GitApi.dart';
import 'package:comfy_dating/ui/controllers/HomeController.dart';
import 'package:comfy_dating/ui/controllers/SearchingController.dart';
import 'package:comfy_dating/ui/templates/buttons/CheckButton.dart';
import 'package:comfy_dating/ui/templates/textFields/MyTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchingController());
    Get.lazyPut(() => GitApi());
  }
}

class SearchingPage extends GetView<SearchingController>{
  final TextEditingController _minHighController = TextEditingController();
  final TextEditingController _maxHighController = TextEditingController();
  final TextEditingController _minWeightController = TextEditingController();
  final TextEditingController _maxWeightController = TextEditingController();
  final TextEditingController _minAgeController = TextEditingController();
  final TextEditingController _maxAgeController = TextEditingController();

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
              onPressed: controller.onSearchFilterTap
            )
          ],
        ),
        Expanded(child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
            ),
            controller.isSearch.value ? _buildSearchFilter() : Container()
          ],
        ))
      ],
    ));
  }

  Widget _buildSearchFilter(){
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      color: MyColors.bg_default,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: Get.height*0.6
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("gender".tr, style: MyStyles.text_title),
                  Container(height: 3),
                  Wrap(
                    spacing: 4,
                    children: [
                      CheckButton(Text("male".tr),
                        isSelect: controller.gender.value == Gender.MALE,
                        onPressed: () => controller.onGenderTap(Gender.MALE)
                      ),
                      CheckButton(Text("female".tr),
                        isSelect: controller.gender.value == Gender.FEMALE,
                        onPressed:  () => controller.onGenderTap(Gender.FEMALE)
                      )
                    ],
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("area".tr, style: MyStyles.text_title),
                      IconButton(
                        onPressed: controller.onAreaFilterTap,
                        icon: Icon(Icons.add_circle, color: MyColors.primary)
                      )
                    ],
                  ),
                  Wrap(
                    spacing: 4,
                    children: controller.twCountys
                        .where((county) => county.selectCount > 0)
                        .map((county) => Text("${county.name}(${county.selectCount})")).toList(),
                  ),
                  Container(height: 5),
                  Row(
                    children: [
                      Text("high".tr, style: MyStyles.text_title),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        width: 48,
                        child: MyTextField(numberOnly: true, maxLength: 3, controller: _minHighController),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7),
                        child: Text("~"),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 6),
                        width: 48,
                        child: MyTextField(numberOnly: true, maxLength: 3, controller: _maxHighController),
                      ),
                      Text("cm"),
                      IconButton(onPressed: (){
                        _minHighController.text = "";
                        _maxHighController.text = "";
                      }, icon: Icon(Icons.cancel, color: MyColors.primary))
                    ],
                  ),
                  Container(height: 6),
                  Row(
                    children: [
                      Text("weight".tr, style: MyStyles.text_title),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        width: 48,
                        child: MyTextField(numberOnly: true, maxLength: 3, controller: _minWeightController),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7),
                        child: Text("~"),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 6),
                        width: 48,
                        child: MyTextField(numberOnly: true, maxLength: 3, controller: _maxWeightController),
                      ),
                      Text("kg"),
                      IconButton(onPressed: (){
                        _minWeightController.text = "";
                        _maxWeightController.text = "";
                      }, icon: Icon(Icons.cancel, color: MyColors.primary))
                    ],
                  ),
                  Container(height: 6),
                  Row(
                    children: [
                      Text("age".tr, style: MyStyles.text_title),
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        width: 48,
                        child: MyTextField(numberOnly: true, maxLength: 3, controller: _minAgeController),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 7),
                        child: Text("~"),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 6),
                        width: 48,
                        child: MyTextField(numberOnly: true, maxLength: 3, controller: _maxAgeController),
                      ),
                      Text("years_old".tr),
                      IconButton(onPressed: (){
                        _minAgeController.text = "";
                        _maxAgeController.text = "";
                      }, icon: Icon(Icons.cancel, color: MyColors.primary))
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: TextButton(onPressed:(){

              }, child: Text("search".tr)),
            )
          ],
        ),
      ),
    );
  }
}