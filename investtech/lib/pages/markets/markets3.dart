import 'package:flutter/material.dart';
import 'package:investtech/widgets/prod_pages/indice.dart';

class WatchList3 extends StatefulWidget {
  @override
  _WatchList3State createState() => _WatchList3State();
}

class _WatchList3State extends State<WatchList3> {
  TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 54, 61, 1),
      body:ListView(
        children: <Widget>[
          Column(
            children: [
              for(int i = 0; i < 38; i++) IndicesHome(id: i,),
            ],
          ),
        ],
      ),
    );
  }
}
