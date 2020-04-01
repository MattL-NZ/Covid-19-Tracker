import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/covid_model.dart';

class Api {
  static const country = "New Zealand";
  final url = Uri.encodeFull("https://corona.lmao.ninja/countries/$country");
  
  var client = new http.Client();

  Future<CovidModel> getLatestData() async {
    var response = await client.get(url);
    return CovidModel.fromJson(json.decode(response.body));
  }
}
