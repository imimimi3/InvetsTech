import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Indicators {
  final int id;
  final String title;
  final String text;
  final String image;


  Indicators({
    @required this.id, 
    @required this.title,
    @required this.image,
    @required this.text, 
    });
}

class IndicatorsData{
  final _data = [
    Indicators(
      id: 1,
      title: 'Средняя скользящая',
      image: 'assets/images/sred_sk.png',
      text: 'Скользящая средняя является результатом усреднения цены бумаги за выбранный период (N). После расчета итоговое значение отображается на графике в виде кривой линии для того, чтобы трейдеры могли рассматривать сглаженные данные, а не фокусироваться на ежедневных колебаниях цен.',
    ),
    Indicators(
      id: 2,
      title: 'Технический индикатор',
      image: 'assets/images/tech_ind.png',
      text: ' Технический индикатор — функция, построенная на значениях статистических показателей торгов (цены, объём торгов и т. д.), анализ поведения которой призван ответить на вопрос изменится или сохранится текущая тенденция на рынке. На основе анализа технических индикаторов трейдеры, сторонники технического анализа, принимают решение об открытии (расширении) или закрытии (сокращении) позиций. ',
    ),
  ];

  List<Indicators> get indicatorsData => [..._data];
}