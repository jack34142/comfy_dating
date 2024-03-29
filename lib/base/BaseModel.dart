import 'package:comfy_dating/http/BaseHttp.dart';

abstract class BaseModel {
  late final BaseHttp http;

  HomeModel(){
    http = BaseHttp();
  }
}