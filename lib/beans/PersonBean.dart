/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

PersonBean personBeanFromJson(String str) => PersonBean.fromJson(json.decode(str));

String personBeanToJson(PersonBean data) => json.encode(data.toJson());

class PersonBean {
    PersonBean({
        required this.area,
        required this.zip,
        required this.birthday,
        required this.height,
        required this.gender,
        required this.name,
        required this.weight,
        required this.id,
    });

    String area;
    int zip;
    DateTime birthday;
    int height;
    String gender;
    String name;
    int weight;
    int id;

    int get age => DateTime.now().year - birthday.year;

    factory PersonBean.fromJson(Map<dynamic, dynamic> json) => PersonBean(
        area: json["area"],
        zip: json["zip"],
        birthday: DateTime.parse(json["birthday"]),
        height: json["height"],
        gender: json["gender"],
        name: json["name"],
        weight: json["weight"],
        id: json["id"],
    );

    Map<dynamic, dynamic> toJson() => {
        "area": area,
        "zip": zip,
        "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "height": height,
        "gender": gender,
        "name": name,
        "weight": weight,
        "id": id,
    };
}
