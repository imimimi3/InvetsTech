import 'package:flutter/material.dart';
import 'package:investtech/models/products.dart';
import 'package:investtech/widgets/new_notification.dart';

import 'package:investtech/widgets/resume.dart';

class Product extends StatefulWidget {
  final String id;
  const Product({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var data_prod;

  @override
  void initState() {
    super.initState();
    data_prod = productsData(widget.id);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white, //Color.fromRGBO(48, 54, 61, 1),
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Color.fromRGBO(203, 207, 212, 1),
        iconTheme: IconThemeData(color: Colors.black),
        title: Row(
          children: [
            FutureBuilder<Products>(
              future: data_prod,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data.name,
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

            IconButton( //!
              icon: Icon(Icons.notifications_active),
              color: Colors.black,
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewNotification(id: widget.id,))),
            ),

            Container(
              child: IconButton( //!
                icon: Icon(Icons.star_outlined),
                color: Colors.black,
                onPressed: () => {},// favorite
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                FutureBuilder<Products>(
                  future: data_prod,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        width: 400,
                        height: 220,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Image.network(
                                    'http://dirdonmz.beget.tech/${snapshot.data.plot}')
                                .image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return CircularProgressIndicator();
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FutureBuilder<Products>(
                      future: data_prod,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container( 
                            margin: const EdgeInsets.only(left: 5),
                            width: 185,
                            height: 210,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: Image.network(
                                        'http://dirdonmz.beget.tech/${snapshot.data.tech_path}')
                                    .image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }

                        return CircularProgressIndicator();
                      },
                    ),

                    FutureBuilder<Products>(
                      future: data_prod,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            margin: const EdgeInsets.only(right: 5),
                            width: 185,
                            height: 210,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: Image.network(
                                        'http://dirdonmz.beget.tech/${snapshot.data.ma_path}')
                                    .image,
                                fit: BoxFit.fill,
                              ),
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

                Resume(id: widget.id,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}