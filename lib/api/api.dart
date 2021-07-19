import 'dart:convert';

import 'package:http/http.dart' as http;

class GetCases {
  String place;
  Map<String, dynamic> res = {};
  GetCases(this.place);
  Future<Map> getCases() async {
    if (this.place == "global") {
      var url = Uri.parse('https://covid19.mathdro.id/api');
      var response = await http.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      res = jsonDecode(response.body);
    } else {
      var urlCountry = 'https://covid19.mathdro.id/api/countries/' + this.place;
      print("place" + urlCountry);
      var url = Uri.parse(urlCountry);
      var response = await http.get(url);
      res = jsonDecode(response.body);
    }
    return res;
  }
}

class GetCenter {
  String disCode;
  String date;
  GetCenter(this.disCode, this.date);
  Map<String, dynamic> res = {};
  Future<Map> getVaccine() async {
    var url = Uri.parse(
        'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByDistrict?district_id=' +
            this.disCode.toString() +
            '&date=' +
            this.date);
    print(
        'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByDistrict?district_id=' +
            this.disCode.toString() +
            '&date=' +
            this.date);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    res = jsonDecode(response.body);
    return res;
  }
}

class GetDistrict {
  String stateCode;
  GetDistrict(this.stateCode);
  Map<String, dynamic> res = {};
  Future<Map> getVaccine() async {
    var url = Uri.parse(
        'https://cdn-api.co-vin.in/api/v2/admin/location/districts/' +
            stateCode);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    res = jsonDecode(response.body);
    return res;
  }
}

class GetStates {
  Map<String, dynamic> res = {};
  Future<Map> getVaccine() async {
    var url =
        Uri.parse('https://cdn-api.co-vin.in/api/v2/admin/location/states');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    res = jsonDecode(response.body);
    return res;
  }
}
