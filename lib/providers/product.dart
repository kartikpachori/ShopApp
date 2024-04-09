import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(String token, String userId) async {
    final oldStatus = isFavorite;
    // final newStatus = !isFavorite; // Toggle the status
    isFavorite = !isFavorite;

    final url = Uri.https('new-project-72be3-default-rtdb.firebaseio.com',
        '/userFavorites/$userId/$id.json', {'auth': token});
    notifyListeners();

    try {
      final response = await http.put(
        url,
        body: json.encode({
          'isFavorite': isFavorite,
        }),
      );
      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
        print('Failed to update favorite status: ${response.body}');
      }
    } catch (error) {
      _setFavValue(oldStatus);
      print('Error toggling favorite status: $error');
      notifyListeners();
    }
  }
}
