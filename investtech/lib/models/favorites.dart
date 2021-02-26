import 'package:flutter/foundation.dart';

class Favorites {
  final int id;
  final int id_prod;
  final String title;
  final double price;


  Favorites({
    @required this.id, 
    @required this.id_prod, 
    @required this.title,
    @required this.price, 
    });
}

class FavoritesData{
  final _data = [
  Favorites(
    id: 1,
    id_prod: 111,
    title: 'Сбербанк',
    price: 270.1,
  ),
  Favorites(
    id: 2,
    id_prod: 222,
    title: 'Яндекс',
    price: 5050.15,
  ),
  Favorites(
    id: 3,
    id_prod: 333,
    title: 'Русидро',
    price: 0.78537,
  ),
  ];

  List<Favorites> get favoritesData => [..._data];
}