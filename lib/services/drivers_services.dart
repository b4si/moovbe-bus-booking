import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:moovbe/core/urls.dart';
import 'package:moovbe/model/drivers_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriversServices {
  Future getDrivers(apiKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final tocken = prefs.getString('access');
    log("${baserul}DriverApi/$apiKey/");
    log(tocken.toString());
    try {
      final response = await http.get(
        Uri.parse("${baserul}DriverApi/$apiKey/"),
        headers: {
          "Authorization": tocken!,
        },
      );
      var temp = jsonDecode(response.body);
      var temp2 = DriversModel.fromJson(temp);
      log(temp2.driverList.toString());
      return temp;
    } catch (e) {
      log(e.toString());
    }
  }

  Future deleteDrivers(id, apiKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final tocken = prefs.getString('access');
    log("${baserul}DriverApi/$apiKey/");
    log(tocken.toString());
    try {
      final response = await http.delete(
        Uri.parse(
          "${baserul}DriverApi/$apiKey/",
        ),
        body: {"driver_id": id},
        headers: {
          "Authorization": tocken!,
        },
      );

      log(response.body.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  Future addDrivers(apiKey, name, licenseNo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final tocken = prefs.getString('access');
    log("${baserul}DriverApi/$apiKey/");
    log(tocken.toString());
    try {
      final response = await http.post(
        Uri.parse(
          "${baserul}DriverApi/$apiKey/",
        ),
        body: {
          "name": name,
          "mobile": "",
          "license_no": licenseNo,
        },
        headers: {
          "Authorization": tocken!,
        },
      );

      log(response.body.toString());
    } catch (e) {
      log(e.toString());
    }
  }
}
