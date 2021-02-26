import 'package:flutter/material.dart';
import 'package:investtech/models/favorites.dart';
// import 'package:investtech/models/products_home.dart';
// import 'package:investtech/widgets/product.dart';

class Favorite extends StatelessWidget {
  final int id;
  const Favorite({Key key, this.id,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FavoritesData favoritesData = FavoritesData();
    //final ProductsData productsData = ProductsData();

    int index = favoritesData.favoritesData.indexOf((favoritesData.favoritesData.firstWhere((favorite) => favorite.id == id)));

    //int indexpr = favoritesData.favoritesData[index].id_prod;

    return Container(
      margin: const EdgeInsets.only(bottom: 1,),
      // padding: const EdgeInsets.only(top: 7,),
      color: Color.fromRGBO(48, 54, 61, 1),
      child: FlatButton(
         onPressed: () => {},//Navigator.push(context, MaterialPageRoute(builder: (context) => Product(id: indexpr,))),
         child: IntrinsicHeight (
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    favoritesData.favoritesData[index].title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(203, 207, 212, 1),
                    ),
                  ),
                  Text(
                    favoritesData.favoritesData[index].price.toString(),
                    style: TextStyle(
                      color: Color.fromRGBO(203, 207, 212, 1),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '+10.6(1.2%)',
                    style: TextStyle(
                      color: Color.fromRGBO(203, 207, 212, 1),
                    ),
                  ),
                ],
              ),
            ],
        ),
         )
      ),
    );
  }
}