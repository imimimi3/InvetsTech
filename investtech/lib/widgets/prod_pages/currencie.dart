import 'package:flutter/material.dart';
import 'package:investtech/models/prod_pages/currencies.dart';
import 'package:investtech/widgets/product.dart';

class CurrencieHome extends StatefulWidget {
  final int id;
  const CurrencieHome({
    Key key,
    this.id,
  }) : super(key: key);

  @override
  _CurrencieHomeState createState() => _CurrencieHomeState();
}

class _CurrencieHomeState extends State<CurrencieHome> {
  var data_prod;

  @override
  void initState() {
    super.initState();
    data_prod = currenciesData();
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.id;

    String prod;

    return Container(
      margin: const EdgeInsets.only(
        bottom: 1,
      ),
      color: Color.fromRGBO(48, 54, 61, 1),
      child: FlatButton(
          // onPressed: () => {},
          child: IntrinsicHeight(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        FutureBuilder<List<Currencies>>(
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
                        FutureBuilder<List<Currencies>>(
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

                        // Text(
                        //   '$change %',
                        //   style: TextStyle(
                        //     color: colorChange,
                        //   ),
                        // ),
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

// import 'package:flutter/material.dart';
// import 'package:investtech/models/products_home.dart';

// import 'package:investtech/widgets/product.dart';

// class ProductHome extends StatelessWidget {
//   final int id;
//   const ProductHome({Key key, this.id,}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ProductsData productsData = ProductsData();
//     Color colorChange;

//     int index = productsData.productsData.indexOf((productsData.productsData.firstWhere((prod) => prod.id == id)));

//     final String change = productsData.productsData[index].change.toString();

//     if (productsData.productsData[index].change > 0.0){
//       colorChange = Colors.green;
//     }
//     else {
//       if (productsData.productsData[index].change < 0.0){
//         colorChange = Colors.red;
//       }
//       else {colorChange = Colors.grey;}
//     }

//     return Container(
//       margin: const EdgeInsets.only(bottom: 1,),
//       // padding: const EdgeInsets.only(top: 7,),
//       color: Color.fromRGBO(48, 54, 61, 1),
//       child: FlatButton(
//          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Product(id: id,))),
//          child: IntrinsicHeight(
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     children: [
//                       Text(
//                         productsData.productsData[index].title,
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Color.fromRGBO(203, 207, 212, 1),
//                         ),
//                       ),

//                     ],
//                   ),

//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         productsData.productsData[index].price.toString(),
//                         style: TextStyle(
//                           color: Color.fromRGBO(203, 207, 212, 1),
//                         ),
//                       ),

//                       Text(
//                         '$change %',
//                         style: TextStyle(
//                           color: colorChange,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),

//               Divider(
//                 thickness: 1,
//                 height: 10,
//                 color: Colors.black38,
//               ),
//             ],
//           ),
//          )
//       ),
//     );
//   }
// }
