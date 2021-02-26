import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Indices>> indicesData() async {
  final response = await http.get('http://10.0.2.2:5000/todo/api/v1.0/indices');
  
  var st;

  if (response.statusCode == 200) {
    st = jsonDecode(response.body);
    //return Album.fromJson(st[0]);
  } else {
    throw Exception('Failed to load data');
  }

  Map data = st[0];
  int index = 0;
  List<Indices> qwe = [];

  for(var item in data.entries){
    if (item.key != '_id'){
      if (item.key.substring(0, 9) == '/indices/'){
        qwe.add(Indices.fromJson(index,item.key.substring(9, item.key.length), item.value));
      }
      index++;
    }
  }

  return qwe;
}

class Indices {
  final int id;
  final String title;
  final String prise;

  Indices({this.id, this.title, this.prise,});
  
  factory Indices.fromJson(id, key, value) {
    return Indices(
      id: id,
      title: key,
      prise: value,
    );
  }
}
