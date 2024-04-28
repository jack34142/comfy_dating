/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

Person personBeanFromJson(String str) => Person.fromJson(json.decode(str));

String personBeanToJson(Person data) => json.encode(data.toJson());

class Person {
    Person({
        required this.area,
        required this.zip,
        required this.birthday,
        required this.gender,
        required this.name,
        required this.weight,
        required this.id,
        required this.avatar,
        required this.height,
    });

    String area;
    int zip;
    DateTime birthday;
    String gender;
    String name;
    int weight;
    int id;
    String avatar;
    int height;

    int get age => DateTime.now().year - birthday.year;

    factory Person.fromJson(Map<dynamic, dynamic> json) => Person(
        area: json["area"],
        zip: json["zip"],
        birthday: DateTime.parse(json["birthday"]),
        gender: json["gender"],
        name: json["name"],
        weight: json["weight"],
        id: json["id"],
        avatar: json["avatar"],
        height: json["height"],
    );

    Map<dynamic, dynamic> toJson() => {
        "area": area,
        "zip": zip,
        "birthday": "${birthday.year.toString().padLeft(4, '0')}-${birthday.month.toString().padLeft(2, '0')}-${birthday.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "name": name,
        "weight": weight,
        "id": id,
        "avatar": avatar,
        "height": height,
    };
}
