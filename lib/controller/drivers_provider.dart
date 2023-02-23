import 'package:flutter/material.dart';
import 'package:moovbe/model/drivers_model.dart';
import 'package:moovbe/services/drivers_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriversProvider with ChangeNotifier {
  List driversList = [];
  Future<void> getDrivers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? apiKey = prefs.getString('apiKey');
    DriversModel response = await DriversServices().getDrivers(apiKey);
    driversList.clear();
    driversList.addAll(response.driverList);
  }

  Future<void> deletetDrivers(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? apiKey = prefs.getString('apiKey');
    await DriversServices().deleteDrivers(id, apiKey);
  }

  Future<void> addDrivers(name, licenseNo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? apiKey = prefs.getString('apiKey');
    await DriversServices().addDrivers(apiKey, name, licenseNo);
  }
}
