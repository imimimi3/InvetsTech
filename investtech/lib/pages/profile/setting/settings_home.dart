import 'package:flutter/material.dart';

class SettingsHome extends StatelessWidget {
  const SettingsHome ({Key key}) : super(key: key);

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
                  margin: const EdgeInsets.only(top: 50, bottom: 5),
                  width: 120,
                  height: 120,
                  child: Icon(Icons.perm_contact_calendar, color: Colors.white, size: 120,),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  child: Text(
                    'Добавить фото',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),

                Text(
                  'Изменить e-mail или телефон',
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
                  'Изменить пароль',
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
                    'Сохранить',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 200),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}
