import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/firebase_options.dart';
import 'package:youtube_clone/services/auth_service.dart';
import 'package:youtube_clone/views/screens/auth%20screens/signup_screen.dart';
import 'package:youtube_clone/views/screens/nav_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  Get.put(AuthService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: BindingsBuilder(() {
        Get.put(AuthService());
      }),
        title: 'Youtube Clone',
        theme: ThemeData(
          brightness: Brightness.dark,
          bottomNavigationBarTheme:
              BottomNavigationBarThemeData(selectedItemColor: Colors.white),
          useMaterial3: true,
        ),
        home: SignupScreen());
  }
}
