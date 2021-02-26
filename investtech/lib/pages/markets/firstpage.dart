import 'package:investtech/pages/markets/markets1.dart';
import 'package:investtech/pages/markets/markets2.dart';
import 'package:investtech/pages/markets/markets3.dart';
import 'package:investtech/pages/markets/markets4.dart';

import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with TickerProviderStateMixin{
  TabController tabController;
  TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: false,
            elevation: 0,
            backgroundColor: Color.fromRGBO(116, 125, 136, 1),
            bottom: PreferredSize(
              preferredSize: null,
              child: Column(
                children: <Widget>[
                  TabBar(
                    controller: tabController,
                    isScrollable: true,
                    indicatorColor: Colors.white,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    labelPadding: EdgeInsets.symmetric(horizontal: 25),
                    tabs: <Widget>[
                      Tab(
                        text: 'Форекс',
                      ),
                      Tab(
                        text: 'Товары',
                      ),
                      Tab(
                        text: 'Индексы',
                      ),
                      Tab(
                        text: 'ETF',
                      ),
                      // Tab(
                      //   text: 'Акции',
                      // ),
                      // Tab(
                      //   text: 'Криптовалюты',
                      // ),
                      // Tab(
                      //   text: 'Облигации',
                      // ),
                      // Tab(
                      //   text: 'Фьючерсы',
                      // ),
                      // Tab(
                      //   text: 'Фонды',
                      // ),
                    ],
                  ),
                ],
              ),
            )),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            WatchList1(), //
            WatchList2(),
            WatchList3(),
            WatchList4(),
            // WatchList5(),
            // WatchList6(),
            // WatchList7(),
            // WatchList8(),
            // WatchList9(),
          ],
        ),
      ),
    );

  }
}


