import 'package:court_mate/features/reservation/domain/entities/forecast.dart';

class ForecastModel {
  CoordModel coord;
  List<WeatherModel> weather;
  String bases;
  MainModel main;
  int visibility;
  WindModel wind;
  CloudsModel clouds;
  int dt;
  SysModel sys;
  int timezone;
  int id;
  String name;
  int cod;

  ForecastModel({
    required this.coord,
    required this.weather,
    required this.bases,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory ForecastModel.fromEntity(Forecast forecast) => ForecastModel(
        coord: CoordModel.fromEntity(forecast.coord),
        weather:
            forecast.weather.map((w) => WeatherModel.fromEntity(w)).toList(),
        bases: forecast.bases,
        main: MainModel.fromEntity(forecast.main),
        visibility: forecast.visibility,
        wind: WindModel.fromEntity(forecast.wind),
        clouds: CloudsModel.fromEntity(forecast.clouds),
        dt: forecast.dt,
        sys: SysModel.fromEntity(forecast.sys),
        timezone: forecast.timezone,
        id: forecast.id,
        name: forecast.name,
        cod: forecast.cod,
      );
  factory ForecastModel.fromRemote(Map<String, dynamic> json) {
    return ForecastModel(
      coord: CoordModel.fromRemote(json['coord']),
      weather: (json['weather'] as List)
          .map((w) => WeatherModel.fromRemote(w))
          .toList(),
      bases: json['base'],
      main: MainModel.fromRemote(json['main']),
      visibility: json['visibility'],
      wind: WindModel.fromRemote(json['wind']),
      clouds: CloudsModel.fromRemote(json['clouds']),
      dt: json['dt'],
      sys: SysModel.fromRemote(json['sys']),
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }

  Forecast toEntity() => Forecast(
        coord: coord.toEntity(),
        weather: weather.map((w) => w.toEntity()).toList(),
        bases: bases,
        main: main.toEntity(),
        visibility: visibility,
        wind: wind.toEntity(),
        clouds: clouds.toEntity(),
        dt: dt,
        sys: sys.toEntity(),
        timezone: timezone,
        id: id,
        name: name,
        cod: cod,
      );
}

class CloudsModel {
  int all;

  CloudsModel({
    required this.all,
  });

  factory CloudsModel.fromEntity(Clouds clouds) => CloudsModel(all: clouds.all);

  factory CloudsModel.fromRemote(Map<String, dynamic> json) {
    return CloudsModel(
      all: json['all'],
    );
  }

  Clouds toEntity() => Clouds(all: all);
}

class CoordModel {
  double lon;
  double lat;

  CoordModel({
    required this.lon,
    required this.lat,
  });

  factory CoordModel.fromEntity(Coord coord) =>
      CoordModel(lon: coord.lon, lat: coord.lat);

  factory CoordModel.fromRemote(Map<String, dynamic> json) {
    return CoordModel(
      lon: json['lon'].toDouble(),
      lat: json['lat'].toDouble(),
    );
  }

  Coord toEntity() => Coord(lon: lon, lat: lat);
}

class MainModel {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  MainModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory MainModel.fromEntity(Main main) => MainModel(
        temp: main.temp,
        feelsLike: main.feelsLike,
        tempMin: main.tempMin,
        tempMax: main.tempMax,
        pressure: main.pressure,
        humidity: main.humidity,
      );
  factory MainModel.fromRemote(Map<String, dynamic> json) {
    return MainModel(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }

  Main toEntity() => Main(
        temp: temp,
        feelsLike: feelsLike,
        tempMin: tempMin,
        tempMax: tempMax,
        pressure: pressure,
        humidity: humidity,
      );
}

class SysModel {
  int type;
  int id;
  String country;
  int sunrise;
  int sunset;

  SysModel({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  factory SysModel.fromEntity(Sys sys) => SysModel(
        type: sys.type,
        id: sys.id,
        country: sys.country,
        sunrise: sys.sunrise,
        sunset: sys.sunset,
      );

  factory SysModel.fromRemote(Map<String, dynamic> json) {
    return SysModel(
      type: json['type'],
      id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }

  Sys toEntity() => Sys(
        type: type,
        id: id,
        country: country,
        sunrise: sunrise,
        sunset: sunset,
      );
}

class WeatherModel {
  int id;
  String main;
  String description;
  String icon;

  WeatherModel({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherModel.fromEntity(Weather weather) => WeatherModel(
        id: weather.id,
        main: weather.main,
        description: weather.description,
        icon: weather.icon,
      );

  factory WeatherModel.fromRemote(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  Weather toEntity() => Weather(
        id: id,
        main: main,
        description: description,
        icon: icon,
      );
}

class WindModel {
  double speed;
  int deg;

  WindModel({
    required this.speed,
    required this.deg,
  });

  factory WindModel.fromEntity(Wind wind) => WindModel(
        speed: wind.speed,
        deg: wind.deg,
      );
  factory WindModel.fromRemote(Map<String, dynamic> json) {
    return WindModel(
      speed: json['speed'].toDouble(),
      deg: json['deg'],
    );
  }

  Wind toEntity() => Wind(
        speed: speed,
        deg: deg,
      );
}
