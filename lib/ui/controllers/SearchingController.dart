import 'dart:convert';
import 'package:comfy_dating/ui/BaseController.dart';
import 'package:comfy_dating/models/Area.dart';
import 'package:comfy_dating/models/Person.dart';
import 'package:comfy_dating/configs/MyColors.dart';
import 'package:comfy_dating/http/GitApi.dart';
import 'package:comfy_dating/ui/templates/bottomSheets/AreaBottomSheet.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SearchingController extends BaseController {
  //static SearchingController get to => Get.find();

  final isSearch = false.obs;

  final persons = <Person>[].obs;
  final twAreas = <Area>[].obs;
  final gender = "".obs;

  @override
  void onInit() {
    super.onInit();
    getTwCountys();
    searchFriends();
  }

  void getTwCountys(){
    showLoading();
    GitApi.to.getTwAreas((areas){
      twAreas.value = areas;
    }, onApiError);
    hideLoading();
  }

  void searchFriends({int? minHeight, int? maxHeight, int? minWeight, int? maxWeight, int? minAge, int? maxAge}){
    isSearch.value = false;
    List<int> zips = [];
    twAreas.forEach((area) {
      area.districts.forEach((district) {
        if(district.isSelect){
          zips.add(int.parse(district.zip));
        }
      });
    });

    //TODO: 預計要跑api, 暫時先這樣
    persons.value = [];
    rootBundle.loadString('assets/jsons/fake_people.json').then((jsonString){
      List<dynamic> datas = jsonDecode(jsonString);

      int len = datas.length;
      for(int i=0; i<len; i++){
        Person person = Person.fromJson(datas[i]);
        if(gender.value != "" && gender.value != person.gender){
          continue;
        }
        if(zips.isNotEmpty && !zips.contains(person.zip)){
          continue;
        }
        if(minHeight != null && person.height < minHeight){
          continue;
        }
        if(maxHeight != null && person.height > maxHeight){
          continue;
        }
        if(minWeight != null && person.weight < minWeight){
          continue;
        }
        if(maxWeight != null && person.weight > maxWeight){
          continue;
        }
        if(minAge != null && person.age < minAge){
          continue;
        }
        if(maxAge != null && person.age > maxAge){
          continue;
        }
        persons.add(person);
      }
    });
  }
  // ------------------------------
  void onSearchFilterTap(){
    if(!isSearch.value){
      if(twAreas.isEmpty){
        getTwCountys();
      }
      isSearch.value = true;
    }else{
      isSearch.value = false;
    }
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