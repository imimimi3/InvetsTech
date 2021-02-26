import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Currencies>> currenciesData() async {
  final response = await http.get('http://10.0.2.2:5000/todo/api/v1.0/currencies');
  
  var st;

  if (response.statusCode == 200) {
    st = jsonDecode(response.body);
    //return Album.fromJson(st[0]);
  } else {
    throw Exception('Failed to load data');
  }

  Map data = st[0];
  int index = 0;
  List<Currencies> qwe = [];

  for(var item in data.entries){
    if (item.key != '_id'){
      if (item.key.substring(0, 12) == '/currencies/'){
        qwe.add(Currencies.fromJson(index,item.key.substring(12, item.key.length), item.value));
      }
      else 
      // {if (!item.key.endWith('btc-eur'))
        qwe.add(Currencies.fromJson(index,item.key.substring(8, item.key.length), item.value));
        // }
      index++;
    }
  }

  return qwe;
}

class Currencies {
  final int id;
  final String title;
  final String prise;

  Currencies({this.id, this.title, this.prise,});
  
  factory Currencies.fromJson(id, key, value) {
    return Currencies(
      id: id,
      title: key,
      prise: value,
    );
  }
}






// import 'package:flutter/foundation.dart';

// class Products {
//   final int id;
//   final String title;
//   final double price;
//   final double change;


//   Products({
//     @required this.id, 
//     @required this.title,
//     @required this.price,
//     @required this.change, 
//     });
// }

// class ProductsData{
//   final _data = [
//   Products(
//     id: 1,
//     title: 'Индекс Мосбиржи',
//     price: 3232.12,
//     change: -15.23,
//   ),
//   Products(
//     id: 2,
//     title: 'PCT',
//     price: 1379.15,
//     change: 1,
//   ),
//   Products(
//     id: 3,
//     title: 'DAX',
//     price: 13576.95,
//     change: -2,
//   ),
  
//     Products(
//     id: 11,
//     title: 'Ethereum',
//     price: 1900.5,
//     change: 0,
//   ),
//   Products(
//     id: 22,
//     title: 'Bitcoin',
//     price: 50000,
//     change: -10,
//   ),
//   Products(
//     id: 33,
//     title: 'DAX',
//     price: 14000,
//     change: 11,
//   ),
//   Products(
//     id: 111,
//     title: 'Сбербанк',
//     price: 270.1,
//     change: 0,
//   ),
//   Products(
//     id: 222,
//     title: 'Яндекс',
//     price: 5050.15,
//     change: 1.3,
//   ),
//   Products(
//     id: 333,
//     title: 'Русидро',
//     price: 0.78537,
//     change: -11.43,
//   ),
//   ];

//   List<Products> get productsData => [..._data];
// }