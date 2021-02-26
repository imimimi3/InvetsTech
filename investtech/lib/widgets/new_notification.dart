import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:investtech/models/notifications.dart';

import 'package:investtech/models/products.dart';
// import 'package:investtech/models/products_home.dart';
// import 'package:investtech/widgets/button.dart';

import 'package:provider/provider.dart';

import 'package:flutter/cupertino.dart';

class Data with ChangeNotifier {
  String _data = 'TopLevel Data 111';

  String get getData => _data;

  void changeString(String newString) {
    _data = newString;

    notifyListeners();
  }
}


class NewNotification extends StatefulWidget {
  final String id;
  const NewNotification({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  _NewNotificationState createState() => _NewNotificationState();
}

void createN(String newIDProd, String newPrice) {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

  Notifications newNotifications = new Notifications(
      id: 4,
      id_prod: newIDProd,
      title: newIDProd,
      price: newPrice,
      date: formattedDate);

  NotificationsData data = NotificationsData();

  data.addNotification = newNotifications;
  //addNotification(newNotifications);
}

class _NewNotificationState extends State<NewNotification> {
  var data_prod;

  @override
  void initState() {
    super.initState();
    data_prod = productsData(widget.id);
  }

  String dropdownValue = 'Рост выше';

  bool email = false;

  void toggleCheckbox(bool value) {
    if (email == false) {
      setState(() {
        email = true;
      });
    } else {
      setState(() {
        email = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
        create: (context) => Data(),
        child: Scaffold(
          backgroundColor: Color.fromRGBO(48, 54, 61, 1),
          appBar: AppBar(
            centerTitle: false,
            elevation: 0,
            backgroundColor: Color.fromRGBO(203, 207, 212, 1),
            iconTheme: IconThemeData(color: Colors.black),
            title: Row(
              children: [
                Text(
                  'Создать уведомление',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          body: Container(
            child: FutureBuilder<Products>(
              future: data_prod,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Text(
                        snapshot.data.name,
                        style: TextStyle(
                          color: Color.fromRGBO(203, 207, 212, 1),
                          fontSize: 18,
                        ),
                      ),

                      // Text(
                      //     'Последняя цена: $lastprice',
                      //     style: TextStyle(
                      //       color: Color.fromRGBO(203, 207, 212, 1),
                      //       fontSize: 18,
                      //       ),
                      //   ),

                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style:
                            TextStyle(color: Color.fromRGBO(203, 207, 212, 1)),
                        underline: Container(
                          height: 2,
                          color: Color.fromRGBO(203, 207, 212, 1),
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        items: <String>['Рост выше', 'Падение ниже']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),

                      TextPrice(),

                      Row(
                        children: <Widget>[
                          Checkbox(
                              value: email,
                              // activeColor: Colors.pink,
                              // checkColor: Colors.white,
                              // materialTapTargetSize: MaterialTapTargetSize.padded,
                              onChanged: (value) {
                                toggleCheckbox(value);
                              }),
                          Text(
                            'Email уведомления',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                      // FutureBuilder<Products>(
                      //   future: data_prod,
                      //   builder: (context, snapshot) {
                      //     if (snapshot.hasData) {
                      //       return Text(
                      //         snapshot.data.name,
                      //         style: TextStyle(
                      //           fontSize: 16,
                      //           color: Colors.black,
                      //         ),
                      //       );
                      //     } else if (snapshot.hasError) {
                      //       return Text("${snapshot.error}");
                      //     }

                      //     return CircularProgressIndicator();
                      //   },
                      // ),

                      RaisedButton(
                        onPressed: () => {
                          Navigator.pop(context),
                          createN(
                            snapshot.data.name,
                            context.watch<Data>().getData,
                          ),
                        },
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          'Создать',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return CircularProgressIndicator();
              },
            ),
          ),
        ));
  }
}

class TextPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 45,
        width: 300,
        margin: const EdgeInsets.only(bottom: 20, top: 5),
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(5),
        //   color: Colors.white,
        // ),
        child: TextField(
          onChanged: (newData) => context.read<Data>().changeString(newData),
          decoration: InputDecoration(
            hintText: 'Укажите желаемую стоимость',
            hintStyle: TextStyle(
              color: Color.fromRGBO(195, 195, 195, 0.5),
              fontSize: 15,
            ),
            // border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:investtech/models/notifications.dart';
// import 'package:investtech/models/products_home.dart';
// import 'package:investtech/widgets/button.dart';

// import 'package:provider/provider.dart';

// class NewNotification extends StatefulWidget {
//   final int id;
//   const NewNotification({Key key, this.id,}) : super(key: key);

//   @override
//   _NewNotificationState createState() => _NewNotificationState();
// }

// class _NewNotificationState extends State<NewNotification> {
//   String dropdownValue = 'Рост выше';

//   bool email = false;

//     void toggleCheckbox(bool value) {

//       if(email == false)
//       {
//         setState(() {
//           email = true;
//         });
//       }
//       else
//       {
//         setState(() {
//           email = false;
//         });
//       }
//     }

//   @override
//   Widget build(BuildContext context) {
//     final ProductsData productsData = ProductsData();

//     int index = productsData.productsData.indexOf((productsData.productsData.firstWhere((notif) => notif.id == widget.id)));

//     String lastprice = productsData.productsData[index].price.toString();

//     return Scaffold(
//       backgroundColor: Color.fromRGBO(48, 54, 61, 1),
//       appBar: AppBar(
//         centerTitle: false,
//         elevation: 0,
//         backgroundColor: Color.fromRGBO(203, 207, 212, 1),
//         iconTheme: IconThemeData(color: Colors.black),
//         title: Row(
//           children: [
//             Text(
//               'Создать уведомление',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Container(
//         child: Column(
//           children: [
//             Text(
//               productsData.productsData[index].title,
//               style: TextStyle(
//                 color: Color.fromRGBO(203, 207, 212, 1),
//                 fontSize: 18,
//                 ),
//             ),

//            Text(
//               'Последняя цена: $lastprice',
//               style: TextStyle(
//                 color: Color.fromRGBO(203, 207, 212, 1),
//                 fontSize: 18,
//                 ),
//             ),

//             DropdownButton<String>(
//               value: dropdownValue,
//               icon: Icon(Icons.arrow_drop_down),
//               iconSize: 24,
//               elevation: 16,
//               style: TextStyle(color: Color.fromRGBO(203, 207, 212, 1)),
//               underline: Container(
//                 height: 2,
//                 color: Color.fromRGBO(203, 207, 212, 1),
//               ),
//               onChanged: (String newValue) {
//                 setState(() {
//                   dropdownValue = newValue;
//                 });
//               },
//               items: <String>['Рост выше', 'Падение ниже'].map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//             ),

//             Container(
//               height: 45,
//               width: 300,
//               margin: const EdgeInsets.only(bottom: 20, top: 5),
//               // decoration: BoxDecoration(
//               //   borderRadius: BorderRadius.circular(5),
//               //   color: Colors.white,
//               // ),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: lastprice,
//                   hintStyle: TextStyle(
//                     color: Color.fromRGBO(195, 195, 195, 0.5),
//                     fontSize: 15,
//                   ),
//                   // border: OutlineInputBorder(),
//                 ),
//               ),
//             ),

//             Row(
//               children: <Widget>[
//                 Checkbox(
//                   value: email,
//                   // activeColor: Colors.pink,
//                   // checkColor: Colors.white,
//                   // materialTapTargetSize: MaterialTapTargetSize.padded,
//                   onChanged: (value) {toggleCheckbox(value);}
//                 ),
//                 Text(
//                   'Email уведомления',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),

//             RaisedButton(
//               onPressed: () => Navigator.pop(context),
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               child: Text(
//                 'Создать',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
