// Create a data class representing the JSON request structure
import 'dart:convert';
import 'dart:math';
import 'package:learning_flutter/device_details.dart';
import 'package:location/location.dart';

class ApiRequest {

  Future<String> frameLoginRequest(context) async {
    DeviceDetails deviceDetails = DeviceDetails(context);
    var lat="",long="";
    LocationData? locationData = await deviceDetails.getLocation();
    if (locationData != null) {
      lat = locationData.latitude.toString();
      long = locationData.longitude.toString();
    }
    var deviceId = await deviceDetails.getDeviceId();
    var os = await deviceDetails.getOsVersion();
    var ip = await deviceDetails.getIpAddress();

    Map<String, dynamic> obj() {
      return {
        'reqType': "R004",
        'deviceId': deviceId,
        'os': os,
        'ip': ip,
        'lat': lat,
        'lon': long,
        'loginType': "NonBio",
        'userId': "9750032435",
        'password': "Mani@123",
        'fcm': "3801982309182039810298301928039810298301928301",
        'requestId': Random().nextInt(12),
        'key':"DBBD47B7899CBA11FAA3DC226805B1FEEF9987AD14BB3D273A50A78CD1DDECDA" //UAT
      };
    }
    print(obj().toString());
    return jsonEncode(obj()).toString(); // Call the obj() function to get the map and then encode it to JSON
  }
  // Convert the class object to a Map for JSON conversion

}
