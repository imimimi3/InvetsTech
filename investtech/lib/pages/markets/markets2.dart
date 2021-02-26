import 'package:flutter/material.dart';
import 'package:investtech/widgets/prod_pages/commoditie.dart';

class WatchList2 extends StatefulWidget {
  @override
  _WatchList2State createState() => _WatchList2State();
}

class _WatchList2State extends State<WatchList2> {
  TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 54, 61, 1),
      body: ListView(
        children: [
          Column(
            children: [
              for(int i = 0; i < 34; i++) CommoditiesHome(id: i,),
            ],
          ),
        ],
      ),
    );
  }
}
