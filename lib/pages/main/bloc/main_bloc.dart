import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_task1_app/data/api/task_api.dart';
import 'package:weather_task1_app/data/models/weather_model.dart';
import 'package:weather_task1_app/di/di.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final _taskApi = di.get<TaskApi>();
  WeatherModel _weather = WeatherModel.fromJson({});

  MainBloc() : super(const MainLoadingState()) {
    on<MainEvent>(
      (event, emit) async {
        if (event is MainLoadEvent) {
          await _emitMainLoadEvent(event, emit);
        } else if (event is MainFindEvent) {
          await _emitMainFindEvent(event, emit);
        }
      },
      transformer: sequential(),
    );
  }

  Future<void> _emitMainLoadEvent(
    MainLoadEvent event,
    Emitter<MainState> emit,
  ) async {
    emit(const MainLoadingState());
    try {
      _weather = await _taskApi.getWeather(region: "tashkent");
      emit(MainSuccessState(weather: _weather));
    } catch (_) {
      emit(const MainFailState(message: "Xatolik sodir bo'ldi :("));
    }
  }

  Future<void> _emitMainFindEvent(
    MainFindEvent event,
    Emitter<MainState> emit,
  ) async {
    emit(const MainLoadingState());
    try {
      _weather = await _taskApi.getWeather(region: event.cityCode);
      emit(MainSuccessState(weather: _weather));
    } catch (e) {
      emit( MainFailState(message: "$e"));
    }
  }
}
