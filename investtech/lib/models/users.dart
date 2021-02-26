import 'package:flutter/foundation.dart';

class Users {
  final String login;
  final String password;

  Users({
    @required this.login, 
    @required this.password, 
    });
}

class UsersData{
  final _data = [

  ];

  List<Users> get usersData => [..._data];
  
  void addNew(Users value) => _data.add(value);
}