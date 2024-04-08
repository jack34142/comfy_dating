import 'package:comfy_dating/http/BaseHttp.dart';

class BaseModel {
  late final BaseHttp http;

  HomeModel(){
    http = BaseHttp();
  }
}