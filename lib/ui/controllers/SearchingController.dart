import 'dart:convert';
import 'package:comfy_dating/base/BaseController.dart';
import 'package:comfy_dating/base/BaseModel.dart';
import 'package:comfy_dating/beans/tw_county.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SearchingController extends BaseController<BaseModel> {
  //static SearchingController get to => Get.find();

  var searchType = 0.obs;
  var twCountys = <TwCounty>[].obs;

  @override
  BaseModel initModel() => BaseModel();

  @override
  void onInit() {
    super.onInit();
    rootBundle.loadString('assets/jsons/taiwan_districts.json').then((jsonString){
      List<dynamic> datas = jsonDecode(jsonString);
      datas.forEach((data) {
        twCountys.add(TwCounty.fromJson(data));
      });
    });
  }

  void onSearchTap(){
    // if(searchType.value == 1){
    //   searchType.value == 0;
    // }else {
    //   searchType.value == 1;
    // }
    Get.bottomSheet(
      Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Text("地區", style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
            )),
          ),
          Expanded(child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemCount: twCountys.length,
            itemBuilder: (context, index){
              TwCounty county = twCountys[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5, top: 12),
                    child: Text(county.name,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: county.districts.map((district) => OutlinedButton(
                      style:  OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        minimumSize: Size.zero,
                      ),
                      onPressed: (){

                      },
                      child: Text(district.name)
                    )).toList(),
                  )
                ],
              );
            }
          ))
        ],
      ),
      backgroundColor: Colors.white,
      // isScrollControlled: true
    );
  }
}