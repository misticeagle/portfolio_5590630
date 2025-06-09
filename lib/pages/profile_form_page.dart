import 'package:flutter/material.dart';
import 'summary_page.dart';

class ProfileFormPage extends StatefulWidget {
  final String name;
  final String email;
  final String about;

  const ProfileFormPage({
    super.key,
    required this.name,
    required this.email,
    required this.about,
  });

  @override
  State<ProfileFormPage> createState() => _ProfileFormPageState();
}

class _ProfileFormPageState extends State<ProfileFormPage> {
  final _formKey = GlobalKey<FormState>();
  late String _name, _email, _about;

  @override
  void initState() {
    super.initState();
    _name = widget.name;
    _email = widget.email;
    _about = widget.about;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: const Text('Eingaben'),
              content: Text('Name: $_name\nEmail: $_email\nÜber mich: $_about'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('OK'),
                ),
              ],
            ),
      ).then((_) {
        Navigator.pop(context, {
          'name': _name,
          'email': _email,
          'about': _about,
        });
      });
    }
  }

  void _goToSummary() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => SummaryPage(
              name: _name,
              email: _email,
              about: _about,
              sliderValue: 0,
              newsletter: false,
              notifications: false,
              darkMode: false,
              offlineMode: false,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil bearbeiten')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(labelText: 'Name'),
                onSaved: (val) => _name = val ?? '',
              ),
              TextFormField(
                initialValue: _email,
                decoration: const InputDecoration(labelText: 'E-Mail'),
                validator:
                    (val) =>
                        val != null && val.contains('@')
                            ? null
                            : 'Ungültige E-Mail',
                onSaved: (val) => _email = val ?? '',
              ),
              TextFormField(
                initialValue: _about,
                decoration: const InputDecoration(labelText: 'Über mich'),
                maxLines: 3,
                onSaved: (val) => _about = val ?? '',
              ),
              const SizedBox(height: 24),
              ElevatedButton(onPressed: _submit, child: const Text('Absenden')),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _goToSummary,
                child: const Text('Zur Zusammenfassung'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
