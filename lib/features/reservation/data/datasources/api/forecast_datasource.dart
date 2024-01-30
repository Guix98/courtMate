import 'dart:convert';

import 'package:court_mate/features/reservation/data/models/forecast_model.dart';
import 'package:http/http.dart' as http;

class ForecastDataSource {
  Future<ForecastModel> getweather() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=London&appid=33b9de75154c2a881c4f16842e48603b');
    final res = await http.get(url);

    return ForecastModel.fromRemote(jsonDecode(res.body));
  }
}
