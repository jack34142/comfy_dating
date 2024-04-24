import 'package:comfy_dating/configs/MyColors.dart';
import 'package:flutter/material.dart';

class MyStyles {
  static TextStyle text_title = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold
  );

  static ButtonStyle btn_transparent = TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: MyColors.primary
  );
}