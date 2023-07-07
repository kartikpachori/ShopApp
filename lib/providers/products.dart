//import 'dart:html';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'T-Shirt',
      description: 'A red t-shirt for men',
      price: 250.00,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 200.00,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: ' Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 150.00,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'Pan',
      description: 'Prepare any meal you want.',
      price: 100.00,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      id: 'p5',
      title: 'Football',
      description: 'Stylish football for footballers',
      price: 500.00,
      imageUrl:
          'https://m0.sportsjoe.ie/wp-content/uploads/2016/10/29101120/GettyImages-617343966-1024x683.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Skirt',
      description: 'Beautiful skirts for girls',
      price: 500.00,
      imageUrl:
          'https://i.pinimg.com/736x/e1/aa/bd/e1aabded945ca5a789d3306859504ce5.jpg',
    ),
    Product(
      id: 'p7',
      title: 'Earings',
      description: 'Glamorous earings',
      price: 200.00,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/71MKCikiIoL._UL1500_.jpg',
    ),
    Product(
      id: 'p8',
      title: 'Kurta',
      description: 'kurta for mens ',
      price: 800.00,
      imageUrl:
          'https://i.etsystatic.com/22388648/r/il/9e3f45/2195667858/il_fullxfull.2195667858_3asm.jpg',
    ),
    Product(
      id: 'p9',
      title: 'Watch',
      description: 'Stylish pair of watches',
      price: 1200.00,
      imageUrl:
          'https://images.pexels.com/photos/1697218/pexels-photo-1697218.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ),
    Product(
      id: 'p10',
      title: 'Shoes',
      description: 'Good looking pair of shoes',
      price: 1500.00,
      imageUrl:
          'https://images.pexels.com/photos/2529157/pexels-photo-2529157.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addProduct(Product product) {
    final url = Uri.https(
        'new-project-72be3-default-rtdb.firebaseio.com', '/products.json');
    return http
        .post(
      url,
      body: json.encode({
        'title': product.title,
        'description': product.description,
        'imageUrl': product.imageUrl,
        'price': product.price,
        'isFavorite': product.isFavorite,
      }),
    )
        .then((response) {
      final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    });
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
