import 'package:court_mate/features/reservation/domain/entities/forecast.dart';

abstract class WeatherRepository {
  Future<Forecast> getWeather();
}
