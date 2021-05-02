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
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      res = jsonDecode(response.body);
    }
    return res;
  }
}
