/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

TwCounty twCountyFromJson(String str) => TwCounty.fromJson(json.decode(str));

String twCountyToJson(TwCounty data) => json.encode(data.toJson());

class TwCounty {
    TwCounty({
        required this.districts,
        required this.name,
    });

    List<District> districts;
    String name;

    factory TwCounty.fromJson(Map<dynamic, dynamic> json) => TwCounty(
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

    factory District.fromJson(Map<dynamic, dynamic> json) => District(
        zip: json["zip"],
        name: json["name"],
    );

    Map<dynamic, dynamic> toJson() => {
        "zip": zip,
        "name": name,
    };
}
