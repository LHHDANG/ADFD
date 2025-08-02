class Place {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String location;

  Place({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.location,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id']?.toString() ?? '',
      name: json['name'] ?? 'Unknown Place',
      description: json['description'] ?? 'No description available',
      imageUrl: json['image_url'] ?? json['imageUrl'] ?? 'https://via.placeholder.com/200',
      location: json['location'] ?? 'Unknown Location',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image_url': imageUrl,
      'location': location,
    };
  }
}