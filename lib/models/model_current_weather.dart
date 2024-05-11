import 'weather/clouds.dart';
import 'weather/coord.dart';
import 'weather/main.dart';
import 'weather/sys.dart';
import 'weather/weather.dart';
import 'weather/wind.dart';

class CurrentWeather {
  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  CurrentWeather({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        coord: json['coord'] == null ? null : Coord.fromJson(json['coord']),
        weather: json['weather'] == null
            ? null
            : List<Weather>.from(
                json['weather'].map((x) => Weather.fromJson(x))),
        base: json['base'] as String?,
        main: json['main'] == null ? null : Main.fromJson(json['main']),
        visibility: json['visibility'] as int?,
        wind: json['wind'] == null ? null : Wind.fromJson(json['wind']),
        clouds: json['clouds'] == null ? null : Clouds.fromJson(json['clouds']),
        dt: json['dt'] as int?,
        sys: json['sys'] == null ? null : Sys.fromJson(json['sys']),
        timezone: json['timezone'] as int?,
        id: json['id'] as int?,
        name: json['name'] as String?,
        cod: json['cod'] as int?,
      );
}
