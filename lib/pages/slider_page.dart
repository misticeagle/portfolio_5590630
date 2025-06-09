import 'package:flutter/material.dart';
import 'summary_page.dart';

class SliderPage extends StatefulWidget {
  final double initialValue;
  const SliderPage({super.key, required this.initialValue});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  late double _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider-Seite')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Slider(
              value: _value,
              min: 0,
              max: 100,
              onChanged: (val) => setState(() => _value = val),
            ),
            Text('Wert: ${_value.toStringAsFixed(0)}'),
            LinearProgressIndicator(value: _value / 100),
            const SizedBox(height: 20),
            Container(width: _value * 2, height: 20, color: Colors.blue),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, _value),
              child: const Text('Speichern und Zurück'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (_) => SummaryPage(
                          name: '',
                          email: '',
                          about: '',
                          sliderValue: _value,
                          newsletter: false,
                          notifications: false,
                          darkMode: false,
                          offlineMode: false,
                        ),
                  ),
                );
              },
              child: const Text('Zur Zusammenfassung'),
            ),
          ],
        ),
      ),
    );
  }
}
