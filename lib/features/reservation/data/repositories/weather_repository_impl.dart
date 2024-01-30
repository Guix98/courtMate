import 'package:court_mate/features/reservation/data/datasources/api/forecast_datasource.dart';
import 'package:court_mate/features/reservation/domain/entities/forecast.dart';
import 'package:court_mate/features/reservation/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final ForecastDataSource forecastDataSource;

  WeatherRepositoryImpl({required this.forecastDataSource});
  @override
  Future<Forecast> getWeather() async {
    final forecast = await forecastDataSource.getweather();
    return forecast.toEntity();
  }
}
