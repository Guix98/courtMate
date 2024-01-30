import 'package:court_mate/features/reservation/data/datasources/api/forecast_datasource.dart';
import 'package:court_mate/features/reservation/data/repositories/weather_repository_impl.dart';
import 'package:court_mate/features/reservation/domain/entities/forecast.dart';
import 'package:court_mate/features/reservation/domain/repositories/weather_repository.dart';
import 'package:court_mate/features/reservation/domain/usecases/get_weather.dart';
import 'package:riverpod/riverpod.dart';

final weatherDataSourceProvider = Provider<ForecastDataSource>((ref) {
  return ForecastDataSource();
});

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  final dataSource = ref.read(weatherDataSourceProvider);
  return WeatherRepositoryImpl(forecastDataSource: dataSource);
});

final getWeatherProvider = Provider<GetWeather>(
  (ref) {
    final repository = ref.read(weatherRepositoryProvider);
    return GetWeather(repository: repository);
  },
);

final forecastFutureProvider = FutureProvider<Forecast?>((ref) async {
  final getWeather = ref.read(getWeatherProvider);

  final forecast = await getWeather();
  print("Lluvia: ${forecast.clouds.all}");
  return forecast;
});
