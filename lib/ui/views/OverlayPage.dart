import 'package:comfy_dating/ui/controllers/OverlayController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OverlayPage extends StatelessWidget{

  final Widget child;

  const OverlayPage(this.child, {super.key});

  @override
  Widget build(context) {
    final controller = Get.put(OverlayController());

    return Stack(
      alignment:Alignment.center,
      children: [
        child,
        Obx(() => Positioned(
          bottom: Get.height*0.1,
          child: AnimatedOpacity(
            opacity: controller.isToast.value ? 1.0 : 0.0,
            duration: Duration(milliseconds: 200),
            child: Container(
              constraints: BoxConstraints(maxWidth: Get.width*0.8),
              // margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
              decoration: BoxDecoration(
                  color: Color(0x88000000),
                  borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              child: Text(controller.toastString.value,
                // softWrap: true,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    decoration: TextDecoration.none
                ),
              ),
            ),
          ),
        ))
      ],
    );
  }
}