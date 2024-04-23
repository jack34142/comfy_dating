import 'package:comfy_dating/base/BaseController.dart';
import 'package:comfy_dating/beans/CountyBean.dart';
import 'package:comfy_dating/configs/MyColors.dart';
import 'package:comfy_dating/enums/Gender.dart';
import 'package:comfy_dating/http/GitApi.dart';
import 'package:comfy_dating/ui/templates/bottomSheets/CountyBottomSheet.dart';
import 'package:get/get.dart';

class SearchingController extends BaseController {
  //static SearchingController get to => Get.find();

  final isSearch = false.obs;

  final twCountys = <CountyBean>[].obs;
  final gender = Gender.NONE.obs;

  // SearchingController(){
  //   rootBundle.loadString('assets/jsons/taiwan_districts.json').then((jsonString){
  //     List<dynamic> datas = jsonDecode(jsonString);
  //     datas.forEach((data) {
  //       twCountys.add(CountyBean.fromJson(data));
  //     });
  //   });
  // }

  @override
  void onInit() {
    super.onInit();
    getTwCountys();
  }

  void getTwCountys(){
    GitApi.to.getTwCountys((countys){
      twCountys.value = countys;
    }, onApiError);
  }
  // ------------------------------
  void onSearchFilterTap(){
    isSearch.value = !isSearch.value;
  }

  void onAreaFilterTap(){
    Get.bottomSheet(
      CountyBottomSheet(twCountys, onDistrictTap: (){
        twCountys.refresh();
      }),
      backgroundColor: MyColors.bg_default,
      // isScrollControlled: true
    );
  }

  void onGenderTap(Gender gender){
    if (this.gender == gender){
      this.gender.value = Gender.NONE;
    }else{
      this.gender.value = gender;
    }
  }
}