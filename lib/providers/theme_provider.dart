import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.light;

  ThemeMode get mode => _mode;

  static ThemeProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<ThemeProvider>(context, listen: listen);
  }

  bool get isLight => _mode == ThemeMode.light;

  void toLight() {
    _mode = ThemeMode.light;
    notifyListeners();
  }

  void toDark() {
    _mode = ThemeMode.dark;
    notifyListeners();
  }

  void change() => isLight ? toDark() : toLight();
}
