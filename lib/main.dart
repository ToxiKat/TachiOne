import 'package:flutter/material.dart';
import 'package:tachione/pages/home_page.dart';
import 'package:tachione/values/themes.dart';
import 'package:tachione/values/variables.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    isDarkTheme.addListener(() {
      setState(() {});
    });
    useSystemTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TachiOne",
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: useSystemTheme.value
          ? ThemeMode.system
          : isDarkTheme.value
              ? ThemeMode.dark
              : ThemeMode.light,
      home: const HomePage(),
    );
  }
}
