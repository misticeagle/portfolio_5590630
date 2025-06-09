import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final String name;
  final String email;
  final String about;
  final double sliderValue;
  final bool newsletter;
  final bool notifications;
  final bool darkMode;
  final bool offlineMode;

  const SummaryPage({
    super.key,
    required this.name,
    required this.email,
    required this.about,
    required this.sliderValue,
    required this.newsletter,
    required this.notifications,
    required this.darkMode,
    required this.offlineMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zusammenfassung')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text(
              '👤 Profil',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Name: $name'),
            Text('E-Mail: $email'),
            Text('Über mich: $about'),
            const Divider(height: 32),

            const Text(
              '🎚️ Slider-Wert',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Wert: ${sliderValue.toStringAsFixed(0)}'),
            const Divider(height: 32),

            const Text(
              '⚙️ Einstellungen',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Newsletter: ${newsletter ? "Ja" : "Nein"}'),
            Text('Benachrichtigungen: ${notifications ? "Ja" : "Nein"}'),
            Text('Dunkler Modus: ${darkMode ? "Aktiviert" : "Deaktiviert"}'),
            Text('Offline-Modus: ${offlineMode ? "Aktiviert" : "Deaktiviert"}'),
          ],
        ),
      ),
    );
  }
}
