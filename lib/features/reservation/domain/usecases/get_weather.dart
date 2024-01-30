import 'package:court_mate/features/reservation/domain/entities/forecast.dart';
import 'package:court_mate/features/reservation/domain/repositories/weather_repository.dart';

class GetWeather {
  final WeatherRepository repository;

  GetWeather({required this.repository});
  Future<Forecast> call() {
    return repository.getWeather();
  }
}
