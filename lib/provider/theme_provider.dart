import 'package:flutter/cupertino.dart';
import '../model/theme_model.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel themeModel = ThemeModel(isLight: false);
  void changeTheme() {
    themeModel.isLight = !themeModel.isLight;
    notifyListeners();
  }
}
