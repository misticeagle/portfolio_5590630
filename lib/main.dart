import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/work_page.dart';
import 'pages/about_page.dart';
import 'pages/contact_page.dart';
import 'pages/slider_page.dart';
import 'pages/profile_form_page.dart';
import 'pages/settings_page.dart';
import 'pages/summary_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Michel Schneider Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[50],
        fontFamily: 'Arial',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF4F46E5),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/work': (context) => const WorkPage(),
        '/about': (context) => const AboutPage(),
        '/contact': (context) => const ContactPage(),
        '/slider': (context) => const SliderPage(initialValue: 50),
        '/profile':
            (context) => const ProfileFormPage(name: '', email: '', about: ''),
        '/settings':
            (context) => const SettingsPage(
              newsletter: false,
              darkMode: false,
              offlineMode: false,
            ),
        '/summary':
            (context) => const SummaryPage(
              name: '',
              email: '',
              about: '',
              sliderValue: 50,
              newsletter: false,
              notifications: false,
              darkMode: false,
              offlineMode: false,
            ),
      },
    );
  }
}
