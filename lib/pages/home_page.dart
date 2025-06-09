import 'package:flutter/material.dart';
import 'slider_page.dart';
import 'profile_form_page.dart';
import 'settings_page.dart';
import 'summary_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = '';
  String email = '';
  String about = '';
  double sliderValue = 50;
  bool newsletter = false;
  bool notifications = false;
  bool darkMode = false;
  bool offlineMode = false;

  void goToSummary() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => SummaryPage(
              name: name,
              email: email,
              about: about,
              sliderValue: sliderValue,
              newsletter: newsletter,
              notifications: notifications,
              darkMode: darkMode,
              offlineMode: offlineMode,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Willkommen im Portfolio von Michel Schneider',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SliderPage(initialValue: sliderValue),
                    ),
                  );
                  if (result != null) setState(() => sliderValue = result);
                },
                child: const Text('Slider-Seite'),
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => ProfileFormPage(
                            name: name,
                            email: email,
                            about: about,
                          ),
                    ),
                  );
                  if (result != null) {
                    setState(() {
                      name = result['name'];
                      email = result['email'];
                      about = result['about'];
                    });
                  }
                },
                child: const Text('Profil bearbeiten'),
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => SettingsPage(
                            newsletter: newsletter,
                            darkMode: darkMode,
                            offlineMode: offlineMode,
                          ),
                    ),
                  );
                  if (result != null) {
                    setState(() {
                      newsletter = result['newsletter'];
                      darkMode = result['darkMode'];
                      offlineMode = result['offlineMode'];
                      notifications = result['notifications'] ?? false;
                    });
                  }
                },
                child: const Text('Einstellungen'),
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: goToSummary,
                child: const Text('Zusammenfassung anzeigen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
