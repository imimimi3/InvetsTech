import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Ideas>> ideasData() async {
  final response = await http.get('http://10.0.2.2:5000/todo/api/v1.0/ideas');
  
  var st;

  if (response.statusCode == 200) {
    st = jsonDecode(response.body);
    //return Album.fromJson(st[0]);
  } else {
    throw Exception('Failed to load data');
  }

  // Map data = st[0];
  int index = 0;
  List<Ideas> qwe = [];

  for(int i = 0; i < st.length; i++){
    if (st[i]['_id'] != '_id'){
      qwe.add(Ideas.fromJson(st[i], index));
      index++;
    }
  }

  return qwe;
}

class Ideas {
  final int id;
  final String title;
  final String description;
  final String source;
  final String date;
  final String current_profit;
  final String goal;
  final String original;
  final String period;

  Ideas({this.description, this.source, this.date, this.current_profit, this.goal, this.original, this.period, this.id, this.title, });
  
  factory Ideas.fromJson(Map<String, dynamic> json, id) {
    var ideas = Ideas(
      id: id,
      title: json['title'],
      description: json['description'],
      source: json['source'],
      date: json['date'],
      current_profit: json['current_profit'],
      goal: json['goal'],
      original: json['original'],
      period: json['period'],
    );
    return ideas;
  }
}
