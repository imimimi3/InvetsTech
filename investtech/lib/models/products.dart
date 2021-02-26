import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Products> productsData(String prod) async {

  final response = await http.get('http://10.0.2.2:5000/todo/api/v1.0/tasks/$prod');

  if (response.statusCode == 200) {
    List st = jsonDecode(response.body);
    
    String image_plot = st[0]['plot'].substring(45, st[0]['plot'].length);
    String image_tech_path = st[0]['tech_path'].substring(45, st[0]['tech_path'].length);
    String image_ma_path = st[0]['ma_path'].substring(45, st[0]['ma_path'].length);

    return Products.fromJson(st[0], image_plot, image_tech_path, image_ma_path);
  } else {
    throw Exception('Failed to load data');
  }

  
}

class Products {
  final Map id;
  final String name;
  final Map short_anal;
  final String plot;
  final String tech_path;
  final String ma_path;

  Products({this.id, this.name, this.short_anal, this.plot, this.tech_path, this.ma_path,});
  
  factory Products.fromJson(Map<String, dynamic> json, String image_plot, String image_tech_path, String image_ma_path) {
    return Products(
      id: json['_id'],
      name: json['name'],
      short_anal: json['short_anal'],
      plot: image_plot,
      tech_path: image_tech_path,
      ma_path: image_ma_path,
    );
  }
}


// Future<List<Products>> productsData(String prod) async {
//   final response = await http.get('http://10.0.2.2:5000/todo/api/tasks/$prod');
  
//   var st;

//   if (response.statusCode == 200) {
//     st = jsonDecode(response.body);
//     //return Album.fromJson(st[0]);
//   } else {
//     throw Exception('Failed to load data');
//   }

//   Map data = st[0];
//   int index = 0;
//   List<Products> qwe = [];

//   for(var item in data.entries){
//     if (item.key != '_id'){
//       if (item.key.substring(0, 12) == '/currencies/'){
//         qwe.add(Products.fromJson(index,item.key.substring(12, item.key.length), item.value));
//       }
//       else 
//       // {if (!item.key.endWith('btc-eur'))
//         qwe.add(Products.fromJson(index,item.key.substring(8, item.key.length), item.value));
//         // }
//       index++;
//     }
//   }

//   return qwe;
// }

// class Products {
//   final int id;
//   final String title;
//   final String prise;

//   Products({this.id, this.title, this.prise,});
  
//   factory Products.fromJson(id, key, value) {
//     return Products(
//       id: id,
//       title: key,
//       prise: value,
//     );
//   }
// }
