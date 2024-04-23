/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

AreaBean twCountyFromJson(String str) => AreaBean.fromJson(json.decode(str));

String twCountyToJson(AreaBean data) => json.encode(data.toJson());

class AreaBean {
    AreaBean({
        required this.districts,
        required this.name,
    });

    List<District> districts;
    String name;
    int selectCount = 0;

    factory AreaBean.fromJson(Map<dynamic, dynamic> json) => AreaBean(
        districts: List<District>.from(json["districts"].map((x) => District.fromJson(x))),
        name: json["name"],
    );

    Map<dynamic, dynamic> toJson() => {
        "districts": List<dynamic>.from(districts.map((x) => x.toJson())),
        "name": name,
    };
}

class District {
    District({
        required this.zip,
        required this.name,
    });

    String zip;
    String name;
    bool isSelect = false;

    factory District.fromJson(Map<dynamic, dynamic> json) => District(
        zip: json["zip"],
        name: json["name"],
    );

    Map<dynamic, dynamic> toJson() => {
        "zip": zip,
        "name": name,
    };
}
