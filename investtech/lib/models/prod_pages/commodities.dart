import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Commodities>> commoditiesData() async {
  final response = await http.get('http://10.0.2.2:5000/todo/api/v1.0/commodities');
  
  var st;

  if (response.statusCode == 200) {
    st = jsonDecode(response.body);
    //return Album.fromJson(st[0]);
  } else {
    throw Exception('Failed to load data');
  }

  Map data = st[0];
  int index = 0;
  List<Commodities> qwe = [];

  for(var item in data.entries){
    if (item.key != '_id'){
      if (item.key.substring(0, 13) == '/commodities/'){
        qwe.add(Commodities.fromJson(index,item.key.substring(13, item.key.length), item.value));
      }
      index++;
    }
  }

  return qwe;
}

class Commodities {
  final int id;
  final String title;
  final String prise;

  Commodities({this.id, this.title, this.prise,});
  
  factory Commodities.fromJson(id, key, value) {
    return Commodities(
      id: id,
      title: key,
      prise: value,
    );
  }
}
