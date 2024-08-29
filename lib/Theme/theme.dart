import 'package:api_demo/Theme/color.dart';
import 'package:flutter/material.dart';

var lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.light(
        surface: ColorApp().lBg,
        onSurface: ColorApp().lText,
        primary: ColorApp().lContainer,
      onPrimary: ColorApp().lButton

    ));

var darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
        surface: ColorApp().dBg,
        onSurface: ColorApp().dText,
        onPrimary: ColorApp().dButton,
        primary: ColorApp().dContainer));
