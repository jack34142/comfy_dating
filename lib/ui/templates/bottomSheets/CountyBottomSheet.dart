import 'package:comfy_dating/beans/CountyBean.dart';
import 'package:comfy_dating/configs/MyStyles.dart';
import 'package:comfy_dating/ui/templates/buttons/CheckButton.dart';
import 'package:flutter/material.dart';

class CountyBottomSheet extends StatelessWidget {

  final List<CountyBean> countys;
  final void Function()? onDistrictTap;

  const CountyBottomSheet(this.countys, {super.key, this.onDistrictTap});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: const Text("地區", style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
            )),
          ),
          Expanded(child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: countys.length,
              itemBuilder: (context, index){
                CountyBean county = countys[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 5, top: 12),
                      child: Text(county.name,
                        style: MyStyles.text_title,
                      ),
                    ),
                    Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: county.districts.map((district) => CheckButton(Text(district.name),
                        isSelect: district.isSelect,
                        onPressed: (){
                          setState((){
                            district.isSelect = !district.isSelect;
                            if(district.isSelect){
                              countys[index].selectCount++;
                            }else{
                              countys[index].selectCount--;
                            }
                            if(onDistrictTap != null){
                              onDistrictTap!();
                            }
                          });
                        },
                      )).toList(),
                    )
                  ],
                );
              }
          ))
        ],
      )
    );
  }

}