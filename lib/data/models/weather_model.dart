class WeatherModel {
  const WeatherModel({
    required this.airT,
    required this.weatherCode,
    required this.datetimeMs,
    required this.isLight,
    required this.city,
  });

  final double airT;
  final String weatherCode;
  final int datetimeMs;
  final bool isLight;
  final _WeatherCity city;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      airT: (json["air_t"] ?? -1) * 1.0,
      weatherCode: json["weather_code"] ?? "",
      datetimeMs: json["datetime_ms"] ?? -1,
      isLight: (json["time_of_day"] ?? "light") != "night",
      city: _WeatherCity.fromJson(json["city"] ?? {}),
    );
  }
}

class _WeatherCity {
  const _WeatherCity({required this.name, required this.title});

  final String name;
  final String title;

  factory _WeatherCity.fromJson(Map<String, dynamic> json) {
    return _WeatherCity(name: json["name"] ?? "", title: json["title"] ?? "");
  }
}
