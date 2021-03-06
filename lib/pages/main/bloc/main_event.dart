part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainLoadEvent extends MainEvent {
  const MainLoadEvent();

  @override
  List<Object?> get props => [];
}

class MainFindEvent extends MainEvent {
  final String cityCode;

  const MainFindEvent({required this.cityCode});

  @override
  List<Object?> get props => [cityCode];
}

class MainChangeThemeEvent extends MainEvent {
  final bool isLight;

  const MainChangeThemeEvent({required this.isLight});

  @override
  List<Object?> get props => [isLight];
}
