import 'package:comfy_dating/configs/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {

  final bool numberOnly;
  final int? maxLength;

  MyTextField({this.numberOnly = false, this.maxLength});

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder border = OutlineInputBorder(
        borderSide: BorderSide(color: MyColors.primary, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10))
    );
    return TextField(
      textAlign: TextAlign.center,
      maxLength: maxLength,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 6),
        // border: border,
        enabledBorder: border,
        focusedBorder: border,
        counterText: ""
      ),
      keyboardType: numberOnly ? TextInputType.number : TextInputType.text,
      inputFormatters: numberOnly ? <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ] : null,
    );
  }
}