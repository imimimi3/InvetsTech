import 'package:flutter/material.dart';
import 'package:investtech/models/ideas_home.dart';
import 'package:investtech/widgets/button.dart';
// import 'package:investtech/widgets/product.dart';

import 'package:url_launcher/url_launcher.dart';

class Idea extends StatefulWidget {
  final int id;
  const Idea({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  _IdeaState createState() => _IdeaState();
}

class _IdeaState extends State<Idea> {
  var data_prod;

  @override
  void initState() {
    super.initState();
    data_prod = ideasData();
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.id;

    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 54, 61, 1),
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Color.fromRGBO(203, 207, 212, 1),
        iconTheme: IconThemeData(color: Colors.black),
        title: FutureBuilder<List<Ideas>>(
          future: data_prod,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data[index].title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          },
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10, right: 50, left: 5),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        VerticalDivider(
                          color: Color.fromRGBO(203, 207, 212, 1),
                          thickness: 2,
                        ),
                        Column(
                          children: [
                            FutureBuilder<List<Ideas>>(
                              future: data_prod,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    snapshot.data[index].current_profit,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(203, 207, 212, 1),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text("${snapshot.error}");
                                }

                                return CircularProgressIndicator();
                              },
                            ),
                            Text(
                              'Прогнозируемая доходность',
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Color.fromRGBO(203, 207, 212, 1),
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Color.fromRGBO(203, 207, 212, 1),
                          thickness: 2,
                        ),
                        Column(
                          children: [
                            FutureBuilder<List<Ideas>>(
                              future: data_prod,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    snapshot.data[index].period,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromRGBO(203, 207, 212, 1),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Text("${snapshot.error}");
                                }

                                return CircularProgressIndicator();
                              },
                            ),
                            Text(
                              'Срок идеи',
                              style: TextStyle(
                                fontSize: 10.0,
                                color: Color.fromRGBO(203, 207, 212, 1),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                
                //Button(title: 'КУПИТЬ', color: Colors.green, goTo: Product(id: ideasData.ideasData[index].id_prod,)),

                Container(
                  margin: const EdgeInsets.only(top:7, bottom: 5, left: 3),
                  child: Text(
                    'ПЛАН:',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Color.fromRGBO(203, 207, 212, 1),
                    ),
                  ),
                ),
                
                Container(
                  margin: const EdgeInsets.only(left: 5, right: 3),
                  child: FutureBuilder<List<Ideas>>(
                    future: data_prod,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          '    ${snapshot.data[index].description}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(203, 207, 212, 1),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      return CircularProgressIndicator();
                    },
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: FutureBuilder<List<Ideas>>(
                    future: data_prod,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return InkWell(
                          child: Text(
                              'Источник: ${snapshot.data[index].source}',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.blueAccent,
                                ),
                            ),
                          onTap: () => launch('${snapshot.data[index].original}'),
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
















// import 'package:flutter/material.dart';
// import 'package:investtech/models/ideas_home.dart';
// import 'package:investtech/widgets/button.dart';
// import 'package:investtech/widgets/product.dart';

// class Idea extends StatelessWidget {
//   final int id;
//   const Idea({Key key, this.id,}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       backgroundColor: Color.fromRGBO(48, 54, 61, 1),
//       appBar: AppBar(
//         centerTitle: false,
//         elevation: 0,
//         backgroundColor: Color.fromRGBO(203, 207, 212, 1),
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Text(
//           ideasData.ideasData[index].title,
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             ),
//         ),
//       ),
//       body: Container(
//         child: ListView(
//           children: [
//             Column(
//               children: <Widget>[
//                 IntrinsicHeight (
//                   child:Row(
//                     children: [
//                       VerticalDivider(
//                         color: Color.fromRGBO(203, 207, 212, 1),
//                         thickness: 2,
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             ideasData.ideasData[index].income,
//                             style: TextStyle(
//                               fontSize: 16.0,
//                               color: Color.fromRGBO(203, 207, 212, 1),
//                             ),
//                           ),
//                           Text(
//                             'Прогнозируемая доходность',
//                             style: TextStyle(
//                               fontSize: 10.0,
//                               color: Color.fromRGBO(203, 207, 212, 1),
//                             ),
//                           ),
//                         ],
//                       ),
//                       VerticalDivider(
//                         color: Color.fromRGBO(203, 207, 212, 1),
//                         thickness: 2,
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             ideasData.ideasData[index].temp,
//                             style: TextStyle(
//                                 fontSize: 16.0,
//                                 color: Color.fromRGBO(203, 207, 212, 1),
//                               ),
//                           ),
//                           Text(
//                             'Срок идеи',
//                             style: TextStyle(
//                                 fontSize: 10.0,
//                                 color: Color.fromRGBO(203, 207, 212, 1),
//                               ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),

//                 Button(title: 'КУПИТЬ', color: Colors.green, goTo: Product(id: ideasData.ideasData[index].id_prod,)),

//                 Text(
//                   'ПЛАН:',
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     color: Color.fromRGBO(203, 207, 212, 1),
//                   ),
//                 ),
//                 Text(
//                   ideasData.ideasData[index].text,
//                   style: TextStyle(
//                     fontSize: 16.0,
//                     color: Color.fromRGBO(203, 207, 212, 1),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:investtech/models/ideas_home.dart';
// // import 'package:investtech/widgets/button.dart';
// // import 'package:investtech/widgets/product.dart';

// // class Idea extends StatelessWidget {
// //   final int id;
// //   const Idea({Key key, this.id,}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     final IdeasData ideasData = IdeasData();

// //     int index = ideasData.ideasData.indexOf((ideasData.ideasData.firstWhere((idea) => idea.id == id)));

// //     return Scaffold(
// //       backgroundColor: Color.fromRGBO(48, 54, 61, 1),
// //       appBar: AppBar(
// //         centerTitle: false,
// //         elevation: 0,
// //         backgroundColor: Color.fromRGBO(203, 207, 212, 1),
// //         iconTheme: IconThemeData(color: Colors.black),
// //         title: Text(
// //           ideasData.ideasData[index].title,
// //           style: TextStyle(
// //             color: Colors.black,
// //             fontSize: 18,
// //             ),
// //         ),
// //       ),
// //       body: Container(
// //         child: ListView(
// //           children: [
// //             Column(
// //               children: <Widget>[
// //                 IntrinsicHeight (
// //                   child:Row(
// //                     children: [
// //                       VerticalDivider(
// //                         color: Color.fromRGBO(203, 207, 212, 1),
// //                         thickness: 2,
// //                       ),
// //                       Column(
// //                         children: [
// //                           Text(
// //                             ideasData.ideasData[index].income,
// //                             style: TextStyle(
// //                               fontSize: 16.0,
// //                               color: Color.fromRGBO(203, 207, 212, 1),
// //                             ),
// //                           ),
// //                           Text(
// //                             'Прогнозируемая доходность',
// //                             style: TextStyle(
// //                               fontSize: 10.0,
// //                               color: Color.fromRGBO(203, 207, 212, 1),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                       VerticalDivider(
// //                         color: Color.fromRGBO(203, 207, 212, 1),
// //                         thickness: 2,
// //                       ),
// //                       Column(
// //                         children: [
// //                           Text(
// //                             ideasData.ideasData[index].temp,
// //                             style: TextStyle(
// //                                 fontSize: 16.0,
// //                                 color: Color.fromRGBO(203, 207, 212, 1),
// //                               ),
// //                           ),
// //                           Text(
// //                             'Срок идеи',
// //                             style: TextStyle(
// //                                 fontSize: 10.0,
// //                                 color: Color.fromRGBO(203, 207, 212, 1),
// //                               ),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),

// //                 Button(title: 'КУПИТЬ', color: Colors.green, goTo: Product(id: ideasData.ideasData[index].id_prod,)),

// //                 Text(
// //                   'ПЛАН:',
// //                   style: TextStyle(
// //                     fontSize: 16.0,
// //                     color: Color.fromRGBO(203, 207, 212, 1),
// //                   ),
// //                 ),
// //                 Text(
// //                   ideasData.ideasData[index].text,
// //                   style: TextStyle(
// //                     fontSize: 16.0,
// //                     color: Color.fromRGBO(203, 207, 212, 1),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
