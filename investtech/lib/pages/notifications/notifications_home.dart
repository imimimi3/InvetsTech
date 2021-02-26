import 'package:flutter/material.dart';
import 'package:investtech/widgets/notification.dart';

class NotificationsHome extends StatefulWidget {
  const NotificationsHome({Key key}) : super(key: key);

  @override
  _NotificationsHomeState createState() => _NotificationsHomeState();
}

class _NotificationsHomeState extends State<NotificationsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 54, 61, 1),
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Color.fromRGBO(203, 207, 212, 1),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Уведомления',
          style: TextStyle(
            color: Colors.black,
            ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                for(int i = 1; i < 4; i++) NewNotification(id: i,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}