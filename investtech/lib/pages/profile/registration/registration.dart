import 'package:flutter/material.dart';
import 'package:investtech/data/user_data.dart';
import 'package:provider/provider.dart';

class Registration extends StatelessWidget {
  const Registration ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
      create: (contex) => Data(),
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              color: Color.fromRGBO(48, 54, 61, 1),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 5),
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset('assets/images/logo_investtech.png').image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 100),
                    child: Text(
                      'InvestTech',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                  ),

                  Text(
                    'Введите e-mail или телефон',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),

                  Container(
                    height: 45,
                    width: 300,
                    margin: const EdgeInsets.only(bottom: 10, top: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '+79000000000',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(45, 45, 45, 0.5),
                          fontSize: 15,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Text(
                    'Пароль',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 300,
                    margin: const EdgeInsets.only(bottom: 10, top: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '********',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(45, 45, 45, 0.5),
                          fontSize: 15,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  Text(
                    'Повторите пароль',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 300,
                    margin: const EdgeInsets.only(bottom: 20, top: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '********',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(45, 45, 45, 0.5),
                          fontSize: 15,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),

                  RaisedButton(
                    onPressed: () => Navigator.pop(context), //!
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      'Регистрация',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 200),
                  ),

                  // Container(
                  //   margin: const EdgeInsets.only(top:10, bottom: 175),
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       AlertDialog(
                  //         content: SingleChildScrollView(
                  //           child: ListBody(
                  //             children: <Widget>[
                  //               Text(
                  //                 'Спасибо за регистрацию',
                  //                 style: TextStyle(
                  //                   fontSize: 25,
                  //                   color: Colors.blue[300],
                  //                 ),
                  //               ),
                  //               Text(
                  //                 'Проверьте почту',
                  //                 style: TextStyle(
                  //                   fontSize: 25,
                  //                   color: Colors.blue[300],
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         actions: <Widget>[
                  //           TextButton(
                  //             child: Text('ОК'),
                  //             onPressed: () {
                  //               Navigator.of(context).pop();
                  //             },
                  //           ),
                  //         ],
                  //       );
                        
                        // Navigator.pop(context);
                  //     },
                  //   ),
                  // ),

                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
