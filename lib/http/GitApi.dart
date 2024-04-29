import 'dart:async';
import 'package:comfy_dating/http/BaseHttp.dart';
import 'package:comfy_dating/models/Area.dart';
import 'package:get/get.dart';

class GitApi extends BaseHttp {
  static GitApi get to => Get.find();

  @override
  String get myBaseUrl => "https://gist.githubusercontent.com";

  Future<bool> getTwAreas(Function(List<Area>) onSuccess, Function(dynamic) onFailed) async {
    Completer<bool> completer = Completer();
    get("/abc873693/2804e64324eaaf26515281710e1792df/raw/a1e1fc17d04b47c564bbd9dba0d59a6a325ec7c1/taiwan_districts.json").then((res){
      if(res.statusCode == 200 && res.body is List){
        List<Area> countys = (res.body as List).map((e) => Area.fromJson(e)).toList();
        onSuccess(countys);
        completer.complete(true);
      }else{
        if(res.body != null){
          onFailed(res.body);
        }else{
          onFailed(res.statusText);
        }
        completer.complete(false);
      }
    }).catchError((e){
      onFailed(e.toString());
      completer.complete(false);
    });
    return completer.future;
  }
}