import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final File image;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });
}

class Products with ChangeNotifier {
  List<Product> curriculaList = [];
  late File image;

  void add({required String title, required String description, required double price}) {
    curriculaList.add(Product(
      id: 1,
      title: title,
      description: description,
      price: price,
      image: image,
    ));
    notifyListeners();
  }

  void delete(String description) {
    curriculaList.removeWhere((element) => element.description == description);
    notifyListeners();
  }

  void deleteImage() => image = image.delete() as File;

  Future getImage(ImageSource src) async {
    // final pickedFile = await ImagePicker().getImage(source: src);
    final pickedFile = await ImagePicker().pickImage(source: src);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      notifyListeners();
      print('Image selected.');
    } else {
      print('No image selected.');
    }
  }
}
