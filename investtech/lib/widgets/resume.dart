import 'package:flutter/material.dart';
// import 'package:investtech/models/resumes.dart';
import 'package:investtech/widgets/indicator.dart';

import 'package:investtech/models/products.dart';

class Resume extends StatefulWidget {
  final String id;
  Resume({Key key, this.id}) : super(key: key);

  @override
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  var data_prod;

  @override
  void initState() {
    super.initState();
    data_prod = productsData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Резюме'),
                FutureBuilder<Products>(
                  future: data_prod,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Color color;

                      switch (snapshot.data.short_anal['Резюме:']) {
                        case 'Активно покупать':
                          color = Colors.green;
                          break;
                        case 'Покупать':
                          color = Colors.green;
                          break;
                        case 'Нейтрально':
                          color = Colors.grey;
                          break;
                        case 'Продавать':
                          color = Colors.red;
                          break;
                        case 'Активно продавать':
                          color = Colors.red;
                          break;
                          break;
                        default:
                          print('ERROR');
                      }
                      return Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          snapshot.data.short_anal['Резюме:'],
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Divider(
                thickness: 1,
                height: 15,
                color: Colors.black,
              ),
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Indicator(
                                id: 1,
                              ))),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Скользящие',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),

                FutureBuilder<Products>(
                  future: data_prod,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      String statusSr =
                          snapshot.data.short_anal['Скол средние:'].substring(
                              0,
                              snapshot.data.short_anal['Скол средние:']
                                      .indexOf('(') -
                                  1);
                      String st1 = snapshot.data.short_anal['Скол средние:']
                          .substring(
                              snapshot.data.short_anal['Скол средние:']
                                      .indexOf('(') +
                                  1,
                              snapshot.data.short_anal['Скол средние:']
                                      .indexOf('/') -
                                  2);
                      String st2 = snapshot.data.short_anal['Скол средние:']
                          .substring(
                              snapshot.data.short_anal['Скол средние:']
                                      .indexOf('/') +
                                  3,
                              snapshot.data.short_anal['Скол средние:'].length -
                                  1);

                      return Column(
                        children: [
                          Text(
                            statusSr,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          Text('Покупать $st1'),
                          Text('Продавать $st2'),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Indicator(
                                id: 2,
                              ))),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'Индикаторы',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),

                // Divider(
                //   thickness: 1,
                //   height: 15,
                //   color: Colors.black,
                // ),

                FutureBuilder<Products>(
                  future: data_prod,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      String statusSr =
                          snapshot.data.short_anal['Тех индикаторы:'].substring(
                              0,
                              snapshot.data.short_anal['Тех индикаторы:']
                                      .indexOf('(') -
                                  1);
                      String st1 = snapshot.data.short_anal['Тех индикаторы:']
                          .substring(
                              snapshot.data.short_anal['Тех индикаторы:']
                                      .indexOf('(') +
                                  1,
                              snapshot.data.short_anal['Тех индикаторы:']
                                      .indexOf('/') -
                                  2);
                      String st2 = snapshot.data.short_anal['Тех индикаторы:']
                          .substring(
                              snapshot.data.short_anal['Тех индикаторы:']
                                      .indexOf('/') +
                                  3,
                              snapshot.data.short_anal['Тех индикаторы:']
                                      .length -
                                  1);

                      return Column(
                        children: [
                          Text(
                            statusSr,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          Text('Покупать $st1'),
                          Text('Продавать $st2'),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
