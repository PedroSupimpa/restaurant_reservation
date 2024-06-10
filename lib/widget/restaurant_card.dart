import 'package:flutter/material.dart';
import '../model/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final VoidCallback onTap;

  RestaurantCard({required this.restaurant, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(restaurant.imageUrl,
            width: 50, height: 50, fit: BoxFit.cover),
        title: Text(restaurant.name),
        subtitle: Text('Available seats: ${restaurant.availableSeats}'),
        onTap: onTap,
      ),
    );
  }
}
