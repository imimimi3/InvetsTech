import 'package:flutter/material.dart';
import 'package:investtech/models/prod_pages/indices.dart';
import 'package:investtech/widgets/product.dart';

class IndicesHome extends StatefulWidget {
  final int id;
  const IndicesHome({Key key, this.id,}) : super(key: key);

  @override
  _IndicesHomeState createState() => _IndicesHomeState();
}

class _IndicesHomeState extends State<IndicesHome> {
  var data_prod;

  @override
  void initState() {
    super.initState();
    data_prod = indicesData();
  }

  @override
  Widget build(BuildContext context) {

    int index = widget.id;

    String prod;

    return Container(
      margin: const EdgeInsets.only(bottom: 1,),
      color: Color.fromRGBO(48, 54, 61, 1),
      child: FlatButton(
        //  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Product(id: widget.id,))),
        //onPressed: () => {},
         child: IntrinsicHeight(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                             FutureBuilder<List<Indices>>(
                              future: data_prod,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  prod = snapshot.data[index].title;
                                  return Text(
                                    snapshot.data[index].title,
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
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      FutureBuilder<List<Indices>>(
                              future: data_prod,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    snapshot.data[index].prise,
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
                    ],
                  ),
                ],
              ),

              Divider(
                thickness: 1,
                height: 10,
                color: Colors.black38,
              ),
            ],
          ),
         ),
         onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Product(id: prod,))),
      ),
    );
  }
}