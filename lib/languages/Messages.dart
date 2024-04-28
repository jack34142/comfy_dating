import 'package:get/get.dart';
import 'en.dart';
import 'zh-CN.dart';
import 'zh-TW.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => { // 按照language code排序, 預設的locale擺後面
    'en': En().messages,
    'zh_CN': ZhCN().messages,
    'zh': ZhTW().messages, //除了大陸, 其他繁中
  };
}