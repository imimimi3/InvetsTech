import 'package:flutter/material.dart';
import 'package:investtech/widgets/favorite.dart';

class FavoritesHome extends StatelessWidget {
  const FavoritesHome({Key key}) : super(key: key);

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
          'Избранное',
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
                Favorite(id: 1,),
                Favorite(id: 3,),
                Favorite(id: 2,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}