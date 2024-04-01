import 'package:comfy_dating/config/MyColors.dart';
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
    enableLog: kDebugMode,
    // navigatorKey: Get.key,
    // navigatorObservers: [GetObserver()],
    title: 'appname'.tr,
    theme: ThemeData(
      primaryColor: MyColors.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.primary,
        // foregroundColor: MyColors.primary
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: MyColors.icon_selected,
        unselectedItemColor: MyColors.icon_unselected
      ),
      textTheme: const TextTheme(
        labelLarge: TextStyle(  //button文字
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
        bodyMedium: TextStyle(  // 一般文字
          fontSize: 16,
        ),
      ),
      buttonTheme: const ButtonThemeData(
        height: 40
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap
    ),
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