import 'package:flutter/material.dart';


class AreaCalculatorPage extends StatefulWidget {
  const AreaCalculatorPage({super.key});

  @override
  State<AreaCalculatorPage> createState() => _AreaCalculatorPageState();
}

class _AreaCalculatorPageState extends State<AreaCalculatorPage> {
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();

  double? _area;

  void _calculateArea() {
    final double? length = double.tryParse(_lengthController.text);
    final double? width = double.tryParse(_widthController.text);

    if (length != null && width != null) {
      setState(() {
        _area = length * width;
      });
    } else {
      setState(() {
        _area = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter valid numbers'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _lengthController,
              decoration: const InputDecoration(
                labelText: 'Enter Length',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _widthController,
              decoration: const InputDecoration(
                labelText: 'Enter Width',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateArea,
              child: const Text('Calculate Area'),
            ),
            const SizedBox(height: 20),
            if (_area != null)
              Text(
                'Area: ${_area!.toStringAsFixed(2)} sq units',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}