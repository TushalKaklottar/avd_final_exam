import 'package:avd_final_exam/view/screen/home_page.dart';
import 'package:avd_final_exam/view/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      useMaterial3: true,
      ),
      getPages: [
        GetPage(
            name: "/",
            page: () => const SplashScreen(),
        ),
        GetPage(
            name: "/home",
            page: () => const HomePage(),
        )
      ],

    );
  }
}
