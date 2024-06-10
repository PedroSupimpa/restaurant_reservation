import 'package:flutter/material.dart';

import '../model/restaurant.dart';
import '../widget/reservation_form.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantDetailScreen({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(restaurant.imageUrl,
                width: double.infinity, height: 200, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              'Available seats: ${restaurant.availableSeats}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ReservationForm(restaurant: restaurant),
          ],
        ),
      ),
    );
  }
}
