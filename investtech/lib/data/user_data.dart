import 'package:flutter/cupertino.dart';
import 'package:investtech/models/users.dart';

class Data with ChangeNotifier{
  UsersData _usersData;
  String login;
  String password;
  

  void addLogin(String value){
    login = value;

    notifyListeners();
  }

  void addPassword(String value){
    password = value;

    notifyListeners();
  }

  Users user;// = new Users(login: login, password: password);

  void addUser(Users user){
    _usersData.addNew(user);

    //notifyListeners();
  }
}