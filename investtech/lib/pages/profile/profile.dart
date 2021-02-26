import 'package:flutter/material.dart';
import 'package:investtech/pages/favorites/favorites_home.dart';
import 'package:investtech/pages/notifications/notifications_home.dart';
import 'package:investtech/pages/profile/login/login_screen.dart';
import 'package:investtech/pages/profile/registration/registration.dart';
import 'package:investtech/pages/profile/setting/settings_home.dart';
import 'package:investtech/widgets/button.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    // SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 54, 61, 1),
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Color.fromRGBO(203, 207, 212, 1),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:<Widget>[
            Button(title: 'РЕГИСТРАЦИЯ', color: Color.fromRGBO(161, 84, 242, 1), goTo: Registration()),
            Button(title: 'ВХОД', color: Color.fromRGBO(111, 207, 151, 1), goTo: Login(),),
            IconButton(
              icon: Icon(Icons.settings), 
              color: Colors.black,
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsHome())),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesHome())),
                  // child: Container(
                  // decoration: BoxDecoration(
                  //   color: Color.fromRGBO(60, 68, 76, 1),
                  // ),
                  // width: 180,
                  // padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 0),
                  color: Color.fromRGBO(60, 68, 76, 1),
                  minWidth: 180,
                  height: 70,
                  child: Column(
                    children: [
                      Icon(
                        Icons.star_border, 
                        color: Color.fromRGBO(203, 207, 212, 1),
                        // onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Login1())),
                      ),
                      Text(
                        'Избранное',
                        style: TextStyle(
                           color: Color.fromRGBO(203, 207, 212, 1)
                        ),
                      ),
                    ],
                  ),
                  
                ),
              // ),
              FlatButton(
                // decoration: BoxDecoration(
                //   color: Color.fromRGBO(60, 68, 76, 1),
                // ),
                // width: 180,
                // padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 0),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsHome())),
                color: Color.fromRGBO(60, 68, 76, 1),
                minWidth: 180,
                height: 70,
                child: Column(
                  children: [
                    Icon(
                      Icons.notifications, 
                      color: Color.fromRGBO(203, 207, 212, 1),
                    ),
                    Text(
                      'Уведомления',
                      style: TextStyle(
                         color: Color.fromRGBO(203, 207, 212, 1)
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                child: Text(
                  'Наши Партнёры и друзья:',
                  style: TextStyle(
                    color: Color.fromRGBO(203, 207, 212, 1),
                    fontSize: 25,
                  ),
                ),
                margin: const EdgeInsets.only(bottom: 15, top: 15),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Image.asset('assets/images/logo_roboforex.png').image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Text(
                          'RoboForex',
                          style: TextStyle(
                            color: Color.fromRGBO(203, 207, 212, 1),
                              fontSize: 16,
                          ),
                        ),
                    ],
                  ),
                  Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Image.asset('assets/images/logo_alpari.png').image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Text(
                          'Альпари',
                          style: TextStyle(
                            color: Color.fromRGBO(203, 207, 212, 1),
                              fontSize: 16,
                          ),
                        ),
                    ],
                  ),
                  Column(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Image.asset('assets/images/logo_fxpro.png').image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Text(
                          'FxPro',
                          style: TextStyle(
                            color: Color.fromRGBO(203, 207, 212, 1),
                              fontSize: 16,
                          ),
                        ),
                      ],
                  ),
                ],
              ),
              Container(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, left: 35, right: 20, top: 10),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset('assets/images/logo_tinkoff.png').image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    'Тинькофф инвестиции',
                    style: TextStyle(
                      color: Color.fromRGBO(203, 207, 212, 1),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, left: 35, right: 20, top: 10),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset('assets/images/logo_sber.png').image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    'Сбербанк инвестиции',
                    style: TextStyle(
                      color: Color.fromRGBO(203, 207, 212, 1),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, left: 35, right: 20, top: 10),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset('assets/images/logo_vtb.png').image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    'ВТБ инвестиции',
                    style: TextStyle(
                      color: Color.fromRGBO(203, 207, 212, 1),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
