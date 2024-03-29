import 'package:comfy_dating/l10n/en.dart';
import 'package:comfy_dating/l10n/zh-CN.dart';
import 'package:comfy_dating/l10n/zh-TW.dart';
import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => { // 按照language code排序, 預設的locale擺後面
    'en': En().messages,
    'zh_CN': ZhCN().messages,
    'zh': ZhTW().messages, //除了大陸, 其他繁中
  };
}