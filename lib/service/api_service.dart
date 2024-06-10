import 'dart:convert';

import '../model/restaurant.dart';

class ApiService {
  Future<List<Restaurant>> fetchRestaurants() async {
    // Simulating network delay
    await Future.delayed(Duration(seconds: 2));

    // Sample JSON data
    const String sampleJson = '''
    [
      {"id": "1", "name": "Restaurant A", "imageUrl": "https://via.placeholder.com/150", "availableSeats": 5},
      {"id": "2", "name": "Restaurant B", "imageUrl": "https://via.placeholder.com/150", "availableSeats": 3},
      {"id": "3", "name": "Restaurant C", "imageUrl": "https://via.placeholder.com/150", "availableSeats": 8}
    ]
    ''';

    List<dynamic> body = json.decode(sampleJson);
    return body.map((json) => Restaurant.fromJson(json)).toList();
  }
}
