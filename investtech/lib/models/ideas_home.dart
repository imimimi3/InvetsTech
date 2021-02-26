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






// import 'package:flutter/foundation.dart';

// class Ideas {
//   final int id;
//   final int id_prod;
//   final String title;
//   final String income;
//   final String temp;
//   final bool status;
//   final String text;

//   Ideas({
//     @required this.id,
//     @required this.id_prod,
//     @required this.title, 
//     @required this.income,
//     @required this.temp,
//     @required this.status,
//     @required this.text,
//     });
// }

// class IdeasData{
//   final _data = [
//   Ideas(
//     id: 1,
//     id_prod: 333,
//     title: 'РусГидро выходит из тумана',
//     income: '43,99%',
//     temp: '12 мес',
//     status: true,
//     text:'''Покупка от уровня 0,757 Р с целью в 1,090 Р на срок 365 дней.
// Потенциальная доходность сделки = 43,99%.
// Акции "РусГидро" продолжают восстанавливаться от многолетних минимумов. 
// С начала года акции повысились на 32%, и мы считаем, что растущий тренд этим не ограничится. В последнее время многое изменилось к лучшему - новое более выгодное тарифообразование для ТЭС в ДФО, вхождение в программу модернизации, перспективы рекордной прибыли и дивидендов в 2020 г., приватизация в будущем и др. Мы ожидаем, что со временем это транслируется в более высокую капитализацию "РусГидро", и инвесторы смогут заработать на росте акций и дивидендах.
//     ''',
//   ),
//   Ideas(
//     id: 2,
//     id_prod: 0,
//     title: 'Ростелеком: не было ни единого разрыва',
//     income: '25,65%',
//     temp: '12 мес',
//     status: true,
//     text:'''Покупка от уровня 95,5 ₽ с целью в 120,0 ₽ на срок 365 дней . Потенциальная доходность сделки = 25,65%.  
// Акции "РусГидро" продолжают восстанавливаться от многолетних минимумов. 
// COVID-19 оказал краткосрочное негативное влияние на телекомы. Если государство не поддержит сектор, телекоммуникационный рынок может упасть на 2.5-3.0% г/г (прогноз Минкомсвязи) из-за сокращения доходов от роуминга, снижения розничных продаж и роста затрат на содержание сетей. Ростелеком ожидает роста выручки минимум на 5% г/г (снижение на 0.7% за 2П20)
// ''',
//   ),
//   Ideas(
//     id: 3,
//     id_prod: 222,
//     title: 'Алиса + Олег = Доходность',
//     income: '38,5%',
//     temp: '6 мес',
//     status: false,
//     text:'''Покупка от уровня 0,757 Р с целью в 1,090 Р на срок 365 дней.
// Потенциальная доходность сделки = 43,99%.
// Акции "РусГидро" продолжают восстанавливаться от многолетних минимумов. 
// С начала года акции повысились на 32%, и мы считаем, что растущий тренд этим не ограничится. В последнее время многое изменилось к лучшему - новое более выгодное тарифообразование для ТЭС в ДФО, вхождение в программу модернизации, перспективы рекордной прибыли и дивидендов в 2020 г., приватизация в будущем и др. Мы ожидаем, что со временем это транслируется в более высокую капитализацию "РусГидро", и инвесторы смогут заработать на росте акций и дивидендах.
//     ''',
//   ),
//   ];

//   List<Ideas> get ideasData => [..._data];
// }