import 'package:flutter/material.dart';
import 'package:investtech/models/prod_pages/currencies.dart';
import 'package:investtech/widgets/prod_pages/currencie.dart';

class WatchList1 extends StatefulWidget {
  const WatchList1({Key key}) : super(key: key);

  @override
  _WatchList1State createState() => _WatchList1State();
}

class _WatchList1State extends State<WatchList1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(48, 54, 61, 1),
        body: ListView(
          children: <Widget>[
            Column(
              children: [
                for(int i = 0; i < 39; i++) CurrencieHome(id: i,),
              ],
            ),
          ],
      ),
    );
  }
}






























// import 'package:flutter/material.dart';
// import 'package:investtech/models/products_home.dart';
// import 'package:investtech/widgets/product_home.dart';

// class WatchList1 extends StatefulWidget {
//   const WatchList1({Key key}) : super(key: key);

//   @override
//   _WatchList1State createState() => _WatchList1State();
// }

// class _WatchList1State extends State<WatchList1> {
//   @override
//   Widget build(BuildContext context) {
//     final ProductsData productsData = ProductsData();

//     // int prIndex = 0;

//     return Scaffold(
//       backgroundColor: Color.fromRGBO(48, 54, 61, 1),
//         body: ListView(
//           children: <Widget>[
//             Column(
//               children: [
//                 // ...productsData.productsData[prIndex](
//                 //   (value) => ProductHome(id: value,),
//                 // ).toList(),
//                 ProductHome(id: 1,),
//                 ProductHome(id: 2,),
//                 ProductHome(id: 3,),
//                 ProductHome(id: 11,),
//                 ProductHome(id: 22,),
//                 ProductHome(id: 33,),
//                 ProductHome(id: 111,),
//                 ProductHome(id: 222,),
//                 ProductHome(id: 333,),
//               ],
//             ),
//           ],
//       ),
//     );
//   }
// }