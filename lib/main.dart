import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_clone/views/screens/other%20screens/home_screen.dart';
import 'package:youtube_clone/views/widgets/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Youtube Clone',
        theme: ThemeData(
          brightness: Brightness.dark,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(selectedItemColor: Colors.white),
          useMaterial3: true,
        ),
        home: HomeScreen());
  }
}
