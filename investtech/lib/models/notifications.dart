import 'package:flutter/foundation.dart';
//import 'package:intl/intl.dart';

class Notifications {
  final int id;
  final String id_prod;
  final String title;
  final String price;
  final String date;


  Notifications({
    @required this.id,
    @required this.id_prod,
    @required this.title,
    @required this.price, 
    @required this.date,
    });
}

class NotificationsData{
  List<Notifications> data = [
  Notifications(
    id: 1,
    id_prod: '11',
    title: 'Ethereum',
    price: '1900.5',
    date: '23 декабря'
  ),
  Notifications(
    id: 2,
    id_prod: '22',
    title: 'Bitcoin',
    price: '50000',
    date: '22 ноября'
  ),
  Notifications(
    id: 3,
    id_prod: '33',
    title: 'DAX',
    price: '14000',
    date: '1 августа'
  ),
  ];

  List<Notifications> get notificationsData => [...data];

  set addNotification(Notifications newNotifications) => data.add(newNotifications);
    // DateTime now = DateTime.now();
    // String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

    // Notifications newNotifications = new Notifications(id: 4, id_prod: newIDProd, title: newTitle, price: newPrice, date:formattedDate);
  //   _data.add(newNotifications);
  // }
}