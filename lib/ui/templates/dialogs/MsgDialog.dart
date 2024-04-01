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
              borderRadius: BorderRadius.all(Radius.circular(13))
          ),
          // insetPadding: EdgeInsets.all(0),  //margin
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 8, left: 13, right: 13, bottom: 1),
                child: Text("message".tr, style: const TextStyle(
                  fontSize: 20,
                )),
              ),
              Flexible(child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 4),
                  child: Text(msg),
                ),
              )),
              Row(
                children: [
                  Expanded(child: MaterialButton(
                    // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    // height: 40,
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