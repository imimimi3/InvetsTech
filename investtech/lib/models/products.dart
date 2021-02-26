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