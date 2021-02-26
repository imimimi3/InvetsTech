import 'package:flutter/material.dart';
import 'package:investtech/widgets/button.dart';

import '../../widgets/idea_home.dart';
import '../../test/test.dart';

class IdeasHome extends StatelessWidget {
  const IdeasHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 54, 61, 1),
      appBar: AppBar(
      backgroundColor: Color.fromRGBO(203, 207, 212, 1),
        title: Text(
          'Инвестиционные идеи для вас',
          style: TextStyle(
            fontSize: 21, 
            color: Colors.black,
            ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: <Widget>[
                for(int i = 0; i < 15; i++) IdeaHome(id: i,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}