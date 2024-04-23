import 'dart:convert';
import 'package:comfy_dating/base/BaseController.dart';
import 'package:comfy_dating/beans/CountyBean.dart';
import 'package:comfy_dating/beans/PersonBean.dart';
import 'package:comfy_dating/configs/MyColors.dart';
import 'package:comfy_dating/http/GitApi.dart';
import 'package:comfy_dating/ui/templates/bottomSheets/CountyBottomSheet.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SearchingController extends BaseController {
  //static SearchingController get to => Get.find();

  final isSearch = false.obs;

  final persons = <PersonBean>[].obs;
  final twAreas = <AreaBean>[].obs;
  final gender = "".obs;

  @override
  void onInit() {
    super.onInit();
    getTwCountys();
    searchFriends();
  }

  void getTwCountys(){
    GitApi.to.getTwAreas((areas){
      twAreas.value = areas;
    }, onApiError);
  }

  void searchFriends({int? minHeight, int? maxHeight, int? minWeight, int? maxWeight, int? minAge, int? maxAge}){
    rootBundle.loadString('assets/jsons/fake_people.json').then((jsonString){
      List<dynamic> datas = jsonDecode(jsonString);
      datas.forEach((data) {
        persons.add(PersonBean.fromJson(data));
      });
    });
  }
  // ------------------------------
  void onSearchFilterTap(){
    isSearch.value = !isSearch.value;
  }

  void onAreaFilterTap(){
    Get.bottomSheet(
      AreaBottomSheet(twAreas, onItemTap: (){
        twAreas.refresh();
      }),
      backgroundColor: MyColors.bg_default,
      // isScrollControlled: true
    );
  }

  void onGenderTap(String gender){
    if (this.gender == gender){
      this.gender.value = "";
    }else{
      this.gender.value = gender;
    }
  }
}