import 'package:flutter/material.dart';

class CarBookingForm extends StatefulWidget {
  @override
  _CarBookingFormState createState() => _CarBookingFormState();
}

class _CarBookingFormState extends State<CarBookingForm> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _pickupLocation;
  String? _dropLocation;
  String? _carType;
  String? _paymentOption;

  bool _addInsurance = false;
  bool _addGPS = false;

  final List<String> _carTypes = [
    'Sedan',
    'SUV',
    'Hatchback',
    'Luxury'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Booking Form'),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),

          child: Form(
            key: _formKey,

            child: ListView(
              children: [

                // Car Image
                Center(
                  child: Image.asset(
                    'assets/car-img-1.png',
                    height: 150,
                  ),
                ),

                SizedBox(height: 20),

                // Name
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter name';
                    }
                    return null;
                  },

                  onSaved: (value) {
                    _name = value;
                  },
                ),

                // Pickup Location
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Pickup Location',
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter pickup location';
                    }
                    return null;
                  },

                  onSaved: (value) {
                    _pickupLocation = value;
                  },
                ),

                // Drop Location
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Drop Location',
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter drop location';
                    }
                    return null;
                  },

                  onSaved: (value) {
                    _dropLocation = value;
                  },
                ),

                SizedBox(height: 20),

                // Car Type
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select Car Type',
                  ),

                  items: _carTypes.map((car) {
                    return DropdownMenuItem(
                      value: car,
                      child: Text(car),
                    );
                  }).toList(),

                  onChanged: (value) {
                    setState(() {
                      _carType = value;
                    });
                  },

                  validator: (value) {
                    if (value == null) {
                      return 'Please select a car type';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20),

                // Payment Option
                Text(
                  'Payment Option:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                RadioListTile<String>(
                  title: Text('Cash'),
                  value: 'Cash',
                  groupValue: _paymentOption,

                  onChanged: (value) {
                    setState(() {
                      _paymentOption = value;
                    });
                  },
                ),

                RadioListTile<String>(
                  title: Text('Online'),
                  value: 'Online',
                  groupValue: _paymentOption,

                  onChanged: (value) {
                    setState(() {
                      _paymentOption = value;
                    });
                  },
                ),

                // Insurance
                CheckboxListTile(
                  title: Text('Add Insurance'),
                  value: _addInsurance,

                  onChanged: (value) {
                    setState(() {
                      _addInsurance = value ?? false;
                    });
                  },

                  controlAffinity:
                      ListTileControlAffinity.leading,
                ),

                // GPS
                CheckboxListTile(
                  title: Text('Add GPS'),
                  value: _addGPS,

                  onChanged: (value) {
                    setState(() {
                      _addGPS = value ?? false;
                    });
                  },

                  controlAffinity:
                      ListTileControlAffinity.leading,
                ),

                SizedBox(height: 20),

                // Book Now Button
                ElevatedButton(
                  child: Text('Book Now'),

                  onPressed: () {
                    if (_formKey.currentState!.validate()) {

                      _formKey.currentState!.save();

                      showDialog(
                        context: context,

                        builder: (_) => AlertDialog(
                          title: Text('Booking Confirmed'),

                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment:
                                CrossAxisAlignment.start,

                            children: [
                              Text('Name: $_name'),
                              Text('From: $_pickupLocation'),
                              Text('To: $_dropLocation'),
                              Text('Car Type: $_carType'),
                              Text('Payment: $_paymentOption'),

                              Text(
                                'Add Insurance: '
                                '${_addInsurance ? 'Yes' : 'No'}',
                              ),

                              Text(
                                'Add GPS: '
                                '${_addGPS ? 'Yes' : 'No'}',
                              ),
                            ],
                          ),

                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },

                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}