class Restaurant {
  final String id;
  final String name;
  final String imageUrl;
  final int availableSeats;

  Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.availableSeats,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      availableSeats: json['availableSeats'],
    );
  }
}
