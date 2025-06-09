import 'package:flutter/material.dart';
import 'summary_page.dart';

class SettingsPage extends StatefulWidget {
  final bool newsletter;
  final bool darkMode;
  final bool offlineMode;

  const SettingsPage({
    super.key,
    required this.newsletter,
    required this.darkMode,
    required this.offlineMode,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _newsletter;
  late bool _notifications;
  late bool _darkMode;
  late bool _offlineMode;

  @override
  void initState() {
    super.initState();
    _newsletter = widget.newsletter;
    _notifications = false; // 2. Checkbox
    _darkMode = widget.darkMode;
    _offlineMode = widget.offlineMode;
  }

  void _save() {
    Navigator.pop(context, {
      'newsletter': _newsletter,
      'notifications': _notifications,
      'darkMode': _darkMode,
      'offlineMode': _offlineMode,
    });
  }

  void _goToSummary() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => SummaryPage(
              name: '',
              email: '',
              about: '',
              sliderValue: 0,
              newsletter: _newsletter,
              notifications: _notifications,
              darkMode: _darkMode,
              offlineMode: _offlineMode,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Einstellungen')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CheckboxListTile(
            title: const Text('Newsletter abonnieren'),
            value: _newsletter,
            onChanged: (val) => setState(() => _newsletter = val!),
          ),
          const SizedBox(height: 8),
          CheckboxListTile(
            title: const Text('Push-Benachrichtigungen aktivieren'),
            value: _notifications,
            onChanged: (val) => setState(() => _notifications = val!),
          ),
          const SizedBox(height: 16),
          SwitchListTile(
            title: const Text('Dunkler Modus'),
            value: _darkMode,
            onChanged: (val) => setState(() => _darkMode = val),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Offline-Modus'),
            value: _offlineMode,
            onChanged: (val) => setState(() => _offlineMode = val),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const Text(
            '🔎 Zusammenfassung:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Newsletter: ${_newsletter ? "Ja" : "Nein"}'),
          Text('Benachrichtigungen: ${_notifications ? "Ja" : "Nein"}'),
          Text('Dark Mode: ${_darkMode ? "Aktiviert" : "Deaktiviert"}'),
          Text('Offline: ${_offlineMode ? "Aktiviert" : "Deaktiviert"}'),
          const SizedBox(height: 24),
          ElevatedButton(onPressed: _save, child: const Text('Speichern')),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: _goToSummary,
            child: const Text('Zur Zusammenfassung'),
          ),
        ],
      ),
    );
  }
}
