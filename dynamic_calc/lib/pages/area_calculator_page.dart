import 'package:flutter/material.dart';

class AreaCalculatorPage extends StatefulWidget {
  const AreaCalculatorPage({super.key});

  @override
  State<AreaCalculatorPage> createState() => _AreaCalculatorPageState();
}

class _AreaCalculatorPageState extends State<AreaCalculatorPage> {
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _radiusController = TextEditingController();
  final TextEditingController _baseController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  String _selectedShape = 'Rectangle';
  double? _area;

  final List<String> _shapes = [
    'Rectangle',
    'Square',
    'Circle',
    'Triangle'
  ];

  void _calculateArea() {
    try {
      setState(() {
        _area = null;
      });

      switch (_selectedShape) {
        case 'Rectangle':
          double? l = double.tryParse(_lengthController.text);
          double? w = double.tryParse(_widthController.text);

          if (_isValid(l) && _isValid(w)) {
            setState(() {
              _area = l! * w!;
            });
          } else {
            _showError();
          }
          break;

        case 'Square':
          double? l = double.tryParse(_lengthController.text);

          if (_isValid(l)) {
            setState(() {
              _area = l! * l;
            });
          } else {
            _showError();
          }
          break;

        case 'Circle':
          double? r = double.tryParse(_radiusController.text);

          if (_isValid(r)) {
            setState(() {
              _area = 3.1416 * r! * r;
            });
          } else {
            _showError();
          }
          break;

        case 'Triangle':
          double? b = double.tryParse(_baseController.text);
          double? h = double.tryParse(_heightController.text);

          if (_isValid(b) && _isValid(h)) {
            setState(() {
              _area = 0.5 * b! * h!;
            });
          } else {
            _showError();
          }
          break;
      }
    } catch (e) {
      _showError();
    }
  }

  bool _isValid(double? val) => val != null && val >= 0;

  void _showError() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter valid positive numbers'),
      ),
    );
  }

  void _clearAll() {
    _lengthController.clear();
    _widthController.clear();
    _radiusController.clear();
    _baseController.clear();
    _heightController.clear();

    setState(() {
      _area = null;
    });
  }

  Widget _buildInputs() {
    switch (_selectedShape) {
      case 'Rectangle':
        return Column(
          children: [
            _buildNumberField(_lengthController, 'Length'),
            const SizedBox(height: 10),
            _buildNumberField(_widthController, 'Width'),
          ],
        );

      case 'Square':
        return _buildNumberField(
          _lengthController,
          'Side Length',
        );

      case 'Circle':
        return _buildNumberField(
          _radiusController,
          'Radius',
        );

      case 'Triangle':
        return Column(
          children: [
            _buildNumberField(_baseController, 'Base'),
            const SizedBox(height: 10),
            _buildNumberField(_heightController, 'Height'),
          ],
        );

      default:
        return const SizedBox();
    }
  }

  Widget _buildNumberField(
    TextEditingController controller,
    String label,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📐 Area Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Select Shape: ',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 10),

                DropdownButton<String>(
                  value: _selectedShape,
                  items: _shapes.map((String shape) {
                    return DropdownMenuItem<String>(
                      value: shape,
                      child: Text(shape),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedShape = newValue!;
                      _clearAll();
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            _buildInputs(),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _calculateArea,
                  icon: const Icon(Icons.calculate),
                  label: const Text('Calculate'),
                ),

                OutlinedButton.icon(
                  onPressed: _clearAll,
                  icon: const Icon(Icons.clear),
                  label: const Text('Clear'),
                ),
              ],
            ),

            const SizedBox(height: 30),

            if (_area != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.teal,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Area: ${_area!.toStringAsFixed(2)} sq units',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}