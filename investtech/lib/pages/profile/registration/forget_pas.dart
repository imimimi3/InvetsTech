import 'package:flutter/material.dart';
import 'package:investtech/pages/profile/registration/registration.dart';

class Forget extends StatelessWidget {
  const Forget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  margin: const EdgeInsets.only(bottom: 200),
                  child: Text(
                    'InvestTech',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),

                Container(
                  height: 45,
                  width: 300,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'E-mail или Телефон',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(45, 45, 45, 0.5),
                        fontSize: 15,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    'Напомнить пароль',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(bottom: 300),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}
