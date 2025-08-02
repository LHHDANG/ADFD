import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/place.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Simulate getAllPlace API call
  static Future<List<Place>> getAllPlace() async {
    try {
      // Using JSONPlaceholder as demo API
      final response = await http.get(Uri.parse('$baseUrl/photos?_limit=8'));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Place(
          id: json['id'].toString(),
          name: json['title'].split(' ').take(2).join(' '), // Take first 2 words as name
          description: json['title'],
          imageUrl: json['url'],
          location: 'Location ${json['id']}',
        )).toList();
      } else {
        throw Exception('Failed to load places');
      }
    } catch (e) {
      // Return demo data if API fails
      return getDemoPlaces();
    }
  }

  static List<Place> getDemoPlaces() {
    return [
      Place(
        id: '1',
        name: 'Beautiful Beach',
        description: 'A stunning beach with crystal clear waters',
        imageUrl: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=300',
        location: 'Tropical Paradise',
      ),
      Place(
        id: '2',
        name: 'Mountain Vista',
        description: 'Breathtaking mountain views and fresh air',
        imageUrl: 'https://images.unsplash.com/photo-1464822759844-d150badb9906?w=300',
        location: 'Alpine Region',
      ),
      Place(
        id: '3',
        name: 'City Skyline',
        description: 'Modern architecture and urban lifestyle',
        imageUrl: 'https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?w=300',
        location: 'Metropolitan Area',
      ),
      Place(
        id: '4',
        name: 'Forest Trail',
        description: 'Peaceful walking trails through nature',
        imageUrl: 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=300',
        location: 'National Park',
      ),
      Place(
        id: '5',
        name: 'Historic Castle',
        description: 'Ancient architecture and rich history',
        imageUrl: 'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=300',
        location: 'European Countryside',
      ),
      Place(
        id: '6',
        name: 'Desert Oasis',
        description: 'Unique landscape and serene environment',
        imageUrl: 'https://images.unsplash.com/photo-1509316785289-025f5b846b35?w=300',
        location: 'Desert Region',
      ),
    ];
  }
}