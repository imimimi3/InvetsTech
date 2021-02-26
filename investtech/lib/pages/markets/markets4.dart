import 'package:flutter/material.dart';
import 'package:investtech/widgets/prod_pages/etf.dart';

class WatchList4 extends StatefulWidget {
  @override
  _WatchList4State createState() => _WatchList4State();
}

class _WatchList4State extends State<WatchList4> {
  TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 54, 61, 1),
      body:ListView(
        children: <Widget>[
          Column(
            children: [
              for(int i = 0; i < 37; i++) EtfsHome(id: i,),
            ],
          ),
        ],
      ),
    );
  }
}
