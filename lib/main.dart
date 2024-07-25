import 'package:departure_gita/provider/data_provider.dart';
import 'package:departure_gita/provider/lang_provider.dart';
import 'package:departure_gita/provider/theme_provider.dart';
import 'package:departure_gita/view/screen/home_screen.dart';
import 'package:departure_gita/view/screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LangProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode:
        (Provider.of<ThemeProvider>(context).themeModel.isLight != false)
            ? ThemeMode.light
            : ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        initialRoute: 'welcome',
        routes: {
          '/': (context) => const HomePage(),
          'welcome': (context) => const WelcomeScreen(),
        },
      ),
    );
  }
}
