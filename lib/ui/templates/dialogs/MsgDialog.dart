import 'package:comfy_dating/configs/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MsgDialog extends StatelessWidget {
  final String msg;

  MsgDialog(this.msg);

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        child: Dialog(
          clipBehavior: Clip.hardEdge,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(18))
          ),
          // insetPadding: EdgeInsets.all(0),  //margin
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 1),
                child: Text("message".tr, style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: MyColors.primary
                )),
              ),
              Flexible(child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 4),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: 58,
                    ),
                    child:Center(
                      child: Text(msg),
                    ),
                  )
                ),
              )),
              Row(
                children: [
                  Expanded(child: MaterialButton(
                    // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    height: 45,
                    onPressed: (){
                      Get.back();
                    },
                    child: Text("close".tr)
                  ))
                ],
              )
            ],
          ),
        )
    );
  }

}