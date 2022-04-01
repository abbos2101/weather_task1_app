import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_task1_app/data/utils/themes.dart';
import 'package:weather_task1_app/di/di.dart';
import 'package:weather_task1_app/pages/main/main_page.dart';
import 'package:weather_task1_app/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runZonedGuarded(
    () => runApp(const MyApp()),
    (error, stack) {
      //insert crash analytics
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        //Theme, Til o'zgartirishlar
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, theme, _) {
          return MaterialApp(
            title: 'Weather Task1',
            debugShowCheckedModeBanner: false,
            theme: MyThemes.light(),
            darkTheme: MyThemes.dark(),
            themeMode: theme.mode,
            home: const MainPage(),
          );
        },
      ),
    );
  }
}
