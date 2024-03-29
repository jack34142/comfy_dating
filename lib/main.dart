import 'package:comfy_dating/l10n/Messages.dart';
import 'package:comfy_dating/ui/views/HomePage.dart';
import 'package:comfy_dating/ui/views/MemberPage.dart';
import 'package:comfy_dating/ui/views/MessagePage.dart';
import 'package:comfy_dating/ui/views/SearchingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  if (!kDebugMode) {
    debugPrint = (String? message, {int? wrapWidth}) => null;
  }

  runApp(GetMaterialApp(
    title: 'appname'.tr,
    enableLog: kDebugMode,
    // navigatorKey: Get.key,
    // navigatorObservers: [GetObserver()],
    popGesture: true,
    initialRoute: '/home',
    getPages: [  // 子頁面需要在HomeController設定
      GetPage(name: '/home', page: () => HomePage(), binding: HomeBinding()),
    ],
    translations: Messages(), // 你的翻译
    locale: Get.deviceLocale, // 将会按照此处指定的语言翻译
    fallbackLocale: Locale('en'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
  ));
}