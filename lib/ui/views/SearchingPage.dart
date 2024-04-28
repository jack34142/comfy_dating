import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:comfy_dating/ui/models/Area.dart';
import 'package:comfy_dating/ui/models/Person.dart';
import 'package:comfy_dating/configs/MyColors.dart';
import 'package:comfy_dating/configs/MyStyles.dart';
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
  final TextEditingController _minHeightController = TextEditingController();
  final TextEditingController _maxHeightController = TextEditingController();
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
            _buildPeople(),
            controller.isSearch.value ? _buildSearchOptions() : Container()
          ],
        ))
      ],
    ));
  }

  Widget _buildPeople(){
    const font11 = TextStyle(
        fontSize: 11
    );
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2/3,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10
        ),
        itemCount: controller.persons.length,
        itemBuilder: (context, index){
          Person person = controller.persons[index];
          Color mColor = person.gender == "f" ? MyColors.pink : MyColors.blue;
          return Material(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(11))
            ),
            clipBehavior: Clip.hardEdge,
            child: Ink.image(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                person.avatar,
                // placeholder: (context, url) => CircularProgressIndicator(),
                // errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              child: InkWell(
                onTap: (){

                },
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.only(right: 4, top: 0, bottom: 1, left: 5),
                        decoration: BoxDecoration(
                            color: mColor.withOpacity(0.7),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8))
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(child: Text(person.name, style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                            ))),
                            Container(width: 3, height: 0),
                            Text(person.age.toString(), style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                      )
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [ mColor, mColor.withOpacity(0.7), mColor.withOpacity(0.4)],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              )
                          ),
                          child: Container(
                            padding: EdgeInsets.only(left: 4, top: 2, bottom: 2, right: 5),
                            child: Row(
                              children: [
                                Text(person.height.toString(), style: font11),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 1),
                                  child: Text("/", style: font11),
                                ),
                                Expanded(child: Text(person.weight.toString(), style: font11)),
                                Text(person.area, style: font11)
                              ],
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  Widget _buildSearchOptions(){
    return Container(
      // color: MyColors.shadow,
      child: Column(
        children: [
          Material(
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
                                isSelect: controller.gender.value == "m",
                                onPressed: () => controller.onGenderTap("m")
                            ),
                            CheckButton(Text("female".tr),
                                isSelect: controller.gender.value == "f",
                                onPressed:  () => controller.onGenderTap("f")
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
                          children: controller.twAreas
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
                              child: MyTextField(numberOnly: true, maxLength: 3, controller: _minHeightController),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 7),
                              child: Text("~"),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 6),
                              width: 48,
                              child: MyTextField(numberOnly: true, maxLength: 3, controller: _maxHeightController),
                            ),
                            Text("cm"),
                            IconButton(onPressed: (){
                              _minHeightController.text = "";
                              _maxHeightController.text = "";
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
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: MyStyles.btn_transparent,
                          onPressed: (){
                            controller.gender.value = "";
                            _minHeightController.text = "";
                            _maxHeightController.text = "";
                            _minWeightController.text = "";
                            _maxWeightController.text = "";
                            _minAgeController.text = "";
                            _maxAgeController.text = "";

                            int len = controller.twAreas.length;
                            for(int i=0; i<len; i++){
                              Area area = controller.twAreas[i];
                              if(area.selectCount != 0){
                                area.districts = area.districts.map((district){
                                  district.isSelect = false;
                                  return district;
                                }).toList();
                                area.selectCount = 0;
                                controller.twAreas[i] = area;
                              }
                            }
                            controller.searchFriends();
                          },
                          child: Text("clear".tr)
                        ),
                        TextButton(onPressed:(){
                          controller.searchFriends(
                              minHeight: _minHeightController.text.isNotEmpty ? int.parse(_minHeightController.text) : null,
                              maxHeight: _maxHeightController.text.isNotEmpty ? int.parse(_maxHeightController.text) : null,
                              minWeight: _minWeightController.text.isNotEmpty ? int.parse(_minWeightController.text) : null,
                              maxWeight: _maxWeightController.text.isNotEmpty ? int.parse(_maxWeightController.text) : null,
                              minAge: _minAgeController.text.isNotEmpty ? int.parse(_minAgeController.text) : null,
                              maxAge: _maxAgeController.text.isNotEmpty ? int.parse(_maxAgeController.text) : null
                          );
                        }, child: Text("search".tr)
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: GestureDetector(
            onTap: controller.onSearchFilterTap,
            child: Container(
              color: Colors.transparent,
            ),
          ))
        ],
      ),
    );
  }
}