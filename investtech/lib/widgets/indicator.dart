import 'package:flutter/material.dart';
import 'package:investtech/models/indicators.dart';

class Indicator extends StatelessWidget {
  final int id;
  const Indicator({Key key, this.id,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IndicatorsData indicatorsData = IndicatorsData();

    int index = indicatorsData.indicatorsData.indexOf((indicatorsData.indicatorsData.firstWhere((ind) => ind.id == id)));

    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 54, 61, 1),
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Color.fromRGBO(203, 207, 212, 1),
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Text(
              indicatorsData.indicatorsData[index].title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                ),
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  width: 420,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset(indicatorsData.indicatorsData[index].image).image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                Text(
                  indicatorsData.indicatorsData[index].text,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    ),
                ), //!
              ],
            ),
          ],
        ),
      ),
    );
  }
}