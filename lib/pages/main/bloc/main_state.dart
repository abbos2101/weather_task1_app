part of 'main_bloc.dart';

abstract class MainState extends Equatable {
  const MainState();
}

class MainLoadingState extends MainState {
  const MainLoadingState();

  @override
  List<Object> get props => [];
}

class MainSuccessState extends MainState {
  final WeatherModel weather;

  const MainSuccessState({required this.weather});

  @override
  List<Object> get props => [weather];
}

class MainFailState extends MainState {
  final String message;

  const MainFailState({required this.message});

  @override
  List<Object> get props => [message];
}
