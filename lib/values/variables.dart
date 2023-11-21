import 'package:flutter/material.dart';

ValueNotifier<bool> isDarkTheme = ValueNotifier<bool>(false);
ValueNotifier<bool> useSystemTheme = ValueNotifier<bool>(true);

List<String> mangaSources = ["mangadex"];
String currentmangaSource = mangaSources[0];
