// To parse this JSON data, do
//
//     final driversModel = driversModelFromJson(jsonString);

import 'dart:convert';

DriversModel driversModelFromJson(String str) =>
    DriversModel.fromJson(json.decode(str));

String driversModelToJson(DriversModel data) => json.encode(data.toJson());

class DriversModel {
  DriversModel({
    required this.status,
    required this.driverList,
  });

  bool status;
  List<DriverList> driverList;

  factory DriversModel.fromJson(Map<String, dynamic> json) => DriversModel(
        status: json["status"],
        driverList: List<DriverList>.from(
            json["driver_list"].map((x) => DriverList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "driver_list": List<dynamic>.from(driverList.map((x) => x.toJson())),
      };
}

class DriverList {
  DriverList({
    required this.id,
    this.name,
    this.mobile,
    this.licenseNo,
  });

  int id;
  String? name;
  String? mobile;
  String? licenseNo;

  factory DriverList.fromJson(Map<String, dynamic> json) => DriverList(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        licenseNo: json["license_no"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "license_no": licenseNo,
      };
}
