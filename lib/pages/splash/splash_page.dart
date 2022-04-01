import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_task1_app/data/hive/task_hive.dart';
import 'package:weather_task1_app/di/di.dart';
import 'package:weather_task1_app/pages/main/main_page.dart';
import 'package:weather_task1_app/providers/theme_provider.dart';
import 'package:weather_task1_app/widgets/custom_safearea.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _taskHive = di.get<TaskHive>();

  @override
  void initState() {
    nextPage();
    super.initState();
  }

  Future<void> nextPage() async {
    if (!await _taskHive.isLight()) {
      ThemeProvider.of(context).toDark();
    }
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (_) => const MainPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomSafeArea(
      child: Scaffold(
        body: Image.asset(
          "assets/images/splash.png",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
