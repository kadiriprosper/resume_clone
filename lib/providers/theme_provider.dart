import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_clone/constants.dart';

final themeProvider = Provider(
  (ref) => ThemeProvider(),
);

class ThemeProvider extends ChangeNotifier {
  ThemeData baseTheme = lightTheme;
  Color rimColor = Colors.black;

  void toggleTheme() {
    if (baseTheme == lightTheme) {
      baseTheme = darkTheme;
      rimColor = Colors.white;
    } else {
      baseTheme = lightTheme;
      rimColor = Colors.black;
    }
    notifyListeners();
  }
}
