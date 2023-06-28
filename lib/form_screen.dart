import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> genders = ['Male', 'Female', 'Other'];
  String _name = '';
  String _email = '';
  String _phone = '';
  String _selectedGender = 'Male';
  String _country = '';
  String _state = '';
  String _city = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print('Form submitted:');
      print('Name: $_name');
      print('Email: $_email');
      print('Phone: $_phone');
      print('Gender: $_selectedGender');
      print('Country: $_country');
      print('State: $_state');
      print('City: $_city');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      prefixIcon: Icon(Icons.phone),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _phone = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: 'Gender',
                      prefixIcon: Icon(Icons.person_outline),
                    ),
                    value: _selectedGender,
                    items: genders.map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value.toString();
                      });
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Country',
                      prefixIcon: Icon(Icons.public),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your country';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _country = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'State',
                      prefixIcon: Icon(Icons.location_city),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your state';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _state = value!;
                    },
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'City',
                      prefixIcon: Icon(Icons.location_on),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your city';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _city = value!;
                    },
                  ),
                  SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Set the background color to blue
                    ),
                    child: Text('Submit',
                    style: TextStyle(
                      color: Colors.white
                    ),),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
