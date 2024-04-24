import 'package:comfy_dating/configs/MyColors.dart';
import 'package:comfy_dating/l10n/Messages.dart';
import 'package:comfy_dating/ui/views/HomePage.dart';
import 'package:comfy_dating/ui/views/OverlayPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  // if (!kDebugMode) {
  //   debugPrint = (String? message, {int? wrapWidth}) => null;
  // }

  runApp(GetMaterialApp(
    enableLog: kDebugMode,
    // navigatorKey: Get.key,
    // navigatorObservers: [
    //   //GetObserver(),
    // ],
    title: 'appname'.tr,
    theme: ThemeData(
      scaffoldBackgroundColor: MyColors.bg_default,
      unselectedWidgetColor: MyColors.icon_unselected,
      colorScheme: ColorScheme.highContrastLight(
        primary: MyColors.primary,  //selected icon color / button text color
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.primary,
        // foregroundColor: MyColors.primary
      ),
      textTheme: const TextTheme(
        labelLarge: TextStyle(  //button文字
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(  // 一般文字
          fontSize: 16,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 1.5,
            color: MyColors.primary
          ),
        )
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: MyColors.primary,
          foregroundColor: MyColors.text_darkbg
        )
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap
    ),
    popGesture: true,
    builder: (context, child){
      return OverlayPage(child!);
    },
    initialRoute: '/home',
    getPages: [  // 子頁面需要在HomeController設定
      GetPage(name: '/home', page: () => HomePage(), binding: HomeBinding()),
    ],
    translations: Messages(), // 你的翻译
    locale: Get.deviceLocale, // 将会按照此处指定的语言翻译
    fallbackLocale: Locale('en'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
  ));
}