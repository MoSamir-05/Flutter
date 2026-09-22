import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _email;
  String? _phone;
  String? _gender;
  String? _selectedCity;

  bool _agree = false;

  List<String> _cities = [
    'Ahmedabad',
    'Surat',
    'Rajkot',
    'Vadodara',
    'Gandhinagar'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Registration Form'),
      ),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),

          child: Form(
            key: _formKey,

            child: ListView(
              children: [

                // Full Name
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                  ),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },

                  onSaved: (value) {
                    _name = value;
                  },
                ),

                // Email
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),

                  keyboardType: TextInputType.emailAddress,

                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@')) {
                      return 'Enter valid email';
                    }
                    return null;
                  },

                  onSaved: (value) {
                    _email = value;
                  },
                ),

                // Phone
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                  ),

                  keyboardType: TextInputType.phone,

                  validator: (value) {
                    if (value == null || value.length != 10) {
                      return 'Enter 10-digit phone number';
                    }
                    return null;
                  },

                  onSaved: (value) {
                    _phone = value;
                  },
                ),

                SizedBox(height: 20),

                // Gender
                Text(
                  'Gender:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                RadioListTile<String>(
                  title: Text('Male'),
                  value: 'Male',
                  groupValue: _gender,

                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),

                RadioListTile<String>(
                  title: Text('Female'),
                  value: 'Female',
                  groupValue: _gender,

                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                ),

                // City Dropdown
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select City',
                  ),

                  items: _cities.map((city) {
                    return DropdownMenuItem(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),

                  onChanged: (value) {
                    setState(() {
                      _selectedCity = value;
                    });
                  },

                  validator: (value) {
                    if (value == null) {
                      return 'Please select a city';
                    }
                    return null;
                  },
                ),

                // Checkbox
                CheckboxListTile(
                  title: Text(
                    'I agree to the Terms & Conditions',
                  ),

                  value: _agree,

                  onChanged: (value) {
                    setState(() {
                      _agree = value ?? false;
                    });
                  },

                  controlAffinity:
                      ListTileControlAffinity.leading,
                ),

                SizedBox(height: 20),

                // Submit Button
                ElevatedButton(
                  child: Text('Submit'),

                  onPressed: () {
                    if (_formKey.currentState!.validate()) {

                      if (!_agree) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Please accept the terms',
                            ),
                          ),
                        );

                        return;
                      }

                      _formKey.currentState!.save();

                      showDialog(
                        context: context,

                        builder: (_) => AlertDialog(
                          title: Text(
                            'Registration Successful',
                          ),

                          content: Text(
                            'Thank you, $_name!\n'
                            'Email: $_email\n'
                            'Phone: $_phone\n'
                            'Gender: $_gender\n'
                            'City: $_selectedCity',
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