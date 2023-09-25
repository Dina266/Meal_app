
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  Color primaryColor = Colors.pink;
  Color hintColor = Colors.amber;

  var tm = ThemeMode.system;

  void onChanged(Color color, int type) {
    if (type == 1) {
      primaryColor = color ;//_toMaterialColor(color.hashCode);
    } else if (type == 2) {
      hintColor = color ;//_toMaterialColor(color.hashCode);
      // print(color.hashCode);
    }
    notifyListeners();
  }


MaterialColor _toMaterialColor(colorVal) {
    return MaterialColor(
      colorVal,{
      50: Color(0xFFFFF3E0),
      100: Color(0xFFFFE0B2),
      200: Color(0xFFFFCC80),
      300: Color(0xFFFFB74D),
      400: Color(0xFFFFA726),
      500: Color(colorVal),
      600: Color(0xFFFB8C00),
      700: Color(0xFFF57C00),
      800: Color(0xFFEF6C00),
      900: Color(0xFFE65100),
    },
    );
  }


  void themeModeChange(newThemeVal) async {
    tm = newThemeVal;
    notifyListeners();
  }
}

