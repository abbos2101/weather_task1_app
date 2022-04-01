import 'package:dio/dio.dart';
import 'package:weather_task1_app/data/models/weather_model.dart';

class TaskApi {
  final Dio _dio;

  const TaskApi(this._dio);

  Future<WeatherModel> getWeather({required String region}) async {
    final response = await _dio.get('get-details?region=$region');
    return WeatherModel.fromJson(response.data);
  }
}
