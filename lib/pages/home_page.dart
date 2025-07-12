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
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF4F46E5)),
              child: Text(
                'Navigation',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Work'),
              onTap: () => Navigator.pushNamed(context, '/work'),
            ),
            ListTile(
              title: const Text('About'),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            ListTile(
              title: const Text('Contact'),
              onTap: () => Navigator.pushNamed(context, '/contact'),
            ),
          ],
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: kToolbarHeight + 16),
            const Text(
              'Willkommen im Portfolio von Michel Schneider',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                padding: const EdgeInsets.all(24),
                child: ListView(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => SliderPage(initialValue: sliderValue),
                          ),
                        );
                        if (result != null)
                          setState(() => sliderValue = result);
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
          ],
        ),
      ),
    );
  }
}
