import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Album>> fetchAlbum() async {
  final response = await http.get('http://10.0.2.2:5000/todo/api/v1.0/currencies');
  
  var st;

  if (response.statusCode == 200) {
    st = jsonDecode(response.body);
    //return Album.fromJson(st[0]);
  } else {
    throw Exception('Failed to load data');
  }

  Map data = st[0];
  int index = 0;
  List<Album> qwe = [];

  for(var item in data.entries){
    if (item.key != '_id'){
      if (item.key.substring(0, 12) == '/currencies/'){
        qwe.add(Album.fromJson(index,item.key.substring(12, item.key.length), item.value));
      }
      else {if (!item.key.endWith('btc-eur'))
        qwe.add(Album.fromJson(index,item.key.substring(8, item.key.length), item.value));
        }
      index++;
    }
  }

  return qwe;
}

class Album {
  final int id;
  final String title;
  final String prise;

  Album({this.id, this.title, this.prise,});
  
  factory Album.fromJson(id, key, value) {
    return Album(
      id: id,
      title: key,
      prise: value,
    );
  }
}



class Test extends StatefulWidget {
  Test({Key key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  // Future<List<Album>> 
  var futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Album>>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.first.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}













// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// Future<Album> fetchAlbum() async {
//   // final response =
//   //     await http.get(Uri.https('http://10.0.2.2:5000/todo/api/v1.0/tasks/EUR!USD', '/todo/api/v1.0/tasks/EUR!USD'));

//   final response = await http.get('http://10.0.2.2:5000/todo/api/v1.0/tasks/EUR!USD');

//   if (response.statusCode == 200) {
//     List st = jsonDecode(response.body);
//     return Album.fromJson(st[0]);
//   } else {
//     throw Exception('Failed to load data');
//   }
// }

// class Album {
//   // final int userId;
//   // final int id;
//   final Map id;
//   final String name;
//   final Map short_anal;
//   final String plot;
//   final String tech_path;
//   final String ma_path;

//   Album({this.id, this.name, this.short_anal, this.plot, this.tech_path, this.ma_path,});
  
//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       id: json['_id'],
//       name: json['name'],
//       short_anal: json['short_anal'],
//       plot: json['plot'],
//       tech_path: json['tech_path'],
//       ma_path: json['ma_path'],
//     );
//   }
// }

// class Test extends StatefulWidget {
//   Test({Key key}) : super(key: key);

//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   Future<Album> futureAlbum;

//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<Album>(
//             future: futureAlbum,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text(snapshot.data.name);
//               } else if (snapshot.hasError) {
//                 return Text("${snapshot.error}");
//               }

//               return CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }