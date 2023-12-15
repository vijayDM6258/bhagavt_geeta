import 'package:departure_vm/Models/theme_model.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel themeModel = ThemeModel(isDark: false);

  void ChangeTheme() {
    themeModel.isDark =! themeModel.isDark;
    notifyListeners();
  }
}
