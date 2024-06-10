import 'package:flutter/material.dart';

import '../model/restaurant.dart';

class ReservationForm extends StatefulWidget {
  final Restaurant restaurant;

  ReservationForm({required this.restaurant});

  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  int _seats = 1;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            onSaved: (value) {
              _name = value!;
            },
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<int>(
            decoration: InputDecoration(labelText: 'Seats'),
            value: _seats,
            items: List.generate(
                    widget.restaurant.availableSeats, (index) => index + 1)
                .map((seat) =>
                    DropdownMenuItem(value: seat, child: Text(seat.toString())))
                .toList(),
            onChanged: (value) {
              setState(() {
                _seats = value!;
              });
            },
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Handle reservation logic
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content:
                          Text('Reservation made for $_name, $_seats seats')),
                );
              }
            },
            child: Text('Reserve'),
          ),
        ],
      ),
    );
  }
}
