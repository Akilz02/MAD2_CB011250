//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test02/models/shop.dart';
import 'package:test02/pages/edit_profile_page.dart';
import 'package:test02/pages/profile_page.dart';
import 'package:test02/pages/weather_page.dart';
import 'package:test02/theme/theam_provider.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/auth_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BubbleTeaShop(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).themeData,
        // Change the initial route to '/login'
        initialRoute: '/auth_page',
        //Define the routes for pages
        routes: {
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/home': (context) => const HomePage(),
          '/edit_profile': (context) => EditProfilePage(),
          '/profile': (context) => const ProfilePage(),
          '/auth_page': (context) => const AuthPage(),
          '/weather_page': (context) => const WeatherPage(),
        },
      ),
    );
  }
}
