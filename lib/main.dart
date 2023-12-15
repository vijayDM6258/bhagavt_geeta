import 'package:departure_vm/Providers/language_provider.dart';
import 'package:departure_vm/Providers/theme_provider.dart';
import 'package:departure_vm/Views/Screens/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Departure());
}

class Departure extends StatefulWidget {
  const Departure({super.key});

  @override
  State<Departure> createState() => _DepartureState();
}

class _DepartureState extends State<Departure> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ),
        themeMode:
            (Provider.of<ThemeProvider>(context).themeModel.isDark == false)
                ? ThemeMode.light
                : ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        home: Splash_screen(),
      ),
    );
  }
}
