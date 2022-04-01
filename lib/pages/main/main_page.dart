import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_task1_app/providers/theme_provider.dart';
import 'package:weather_task1_app/widgets/custom_drawer/custom_drawer.dart';
import 'package:weather_task1_app/widgets/custom_safearea.dart';
import 'package:weather_task1_app/widgets/custom_weather_body.dart';
import 'bloc/main_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  final bloc = MainBloc()..add(const MainLoadEvent());

  @override
  void initState() {
    ThemeProvider.of(context).addListener(() {
      bloc.add(MainChangeThemeEvent(
        isLight: ThemeProvider.of(context).isLight,
      ));
    });
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: CustomSafeArea(
        child: Scaffold(
          key: key,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: GestureDetector(
              onTap: () => key.currentState?.openDrawer(),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  "assets/icons/menu.svg",
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
          ),
          drawer: CustomDrawer(
            onTapRegion: (_, it) {
              bloc.add(MainFindEvent(cityCode: it.name));
              key.currentState?.openEndDrawer();
            },
          ),
          body: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              if (state is MainLoadingState) {
                return CustomWeatherBody.loading();
              }
              if (state is MainFailState) {
                return CustomWeatherBody.fail(message: state.message);
              }
              if (state is MainSuccessState) {
                return CustomWeatherBody.success(weather: state.weather);
              }
              throw Exception("$state is not fount");
            },
          ),
        ),
      ),
    );
  }
}
