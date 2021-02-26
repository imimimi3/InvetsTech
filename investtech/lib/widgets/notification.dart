import 'package:flutter/material.dart';
import 'package:investtech/models/notifications.dart';
// import 'package:investtech/models/products_home.dart';

// import 'package:investtech/widgets/product.dart';

class NewNotification extends StatelessWidget {
  final int id;
  const NewNotification({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NotificationsData notificationsData = NotificationsData();
    //final ProductsData productsData =ProductsData();

    int index = notificationsData.notificationsData.indexOf((notificationsData.notificationsData.firstWhere((notif) => notif.id == id)));

    String indexpr =  notificationsData.notificationsData[index].id_prod;

    String newprise = notificationsData.notificationsData[index].price.toString();

    return Container(
      margin: const EdgeInsets.only(bottom: 1,),
      // padding: const EdgeInsets.only(top: 7,),
      color: Color.fromRGBO(48, 54, 61, 1),
      child: FlatButton(
         onPressed: () => {},//Navigator.push(context, MaterialPageRoute(builder: (context) => Product(id: indexpr,))),
         child: IntrinsicHeight (
          child: Row(
            children: [
              //Text('image'), //!
              VerticalDivider(
                color: Color.fromRGBO(203, 207, 212, 1),
                thickness: 2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    notificationsData.notificationsData[index].title,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(203, 207, 212, 1),
                    ),
                  ),
                  Text(
                    'Котировки достигли отметки $newprise',
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