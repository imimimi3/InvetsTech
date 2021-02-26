import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Etfs>> etfsData() async {
  final response = await http.get('http://10.0.2.2:5000/todo/api/v1.0/etfs');
  
  var st;

  if (response.statusCode == 200) {
    st = jsonDecode(response.body);
    //return Album.fromJson(st[0]);
  } else {
    throw Exception('Failed to load data');
  }

  Map data = st[0];
  int index = 0;
  List<Etfs> qwe = [];

  for(var item in data.entries){
    if (item.key != '_id'){
      if (item.key.substring(0, 6) == '/etfs/'){
        qwe.add(Etfs.fromJson(index,item.key.substring(6, item.key.length), item.value));
      }
      index++;
    }
  }

  return qwe;
}

class Etfs {
  final int id;
  final String title;
  final String prise;

  Etfs({this.id, this.title, this.prise,});
  
  factory Etfs.fromJson(id, key, value) {
    return Etfs(
      id: id,
      title: key,
      prise: value,
    );
  }
}
