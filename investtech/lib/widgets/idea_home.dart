import 'package:flutter/material.dart';
import 'package:investtech/models/ideas_home.dart';
import 'package:investtech/widgets/idea.dart';

class IdeaHome extends StatefulWidget {
  final int id;
  const IdeaHome({Key key, this.id}) : super(key: key);

  @override
  _IdeaHomeState createState() => _IdeaHomeState();
}

class _IdeaHomeState extends State<IdeaHome> {
  var data_prod;

  @override
  void initState() {
    super.initState();
    data_prod = ideasData();
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.id;

    int prod;

    return Container(
      margin: const EdgeInsets.only(
        bottom: 1,
      ),
      padding: const EdgeInsets.only(
        top: 7,
      ),
      color: Color.fromRGBO(48, 54, 61, 1),
      child: FlatButton(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              child: FutureBuilder<List<Ideas>>(
                future: data_prod,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    prod = snapshot.data[index].id;
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
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      bottom: 10, left: 20, right: 20, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FutureBuilder<List<Ideas>>(
                        future: data_prod,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Text(
                              snapshot.data[index].current_profit,
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
                      Text(
                        'Прогнозируемая доходность',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Color.fromRGBO(203, 207, 212, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder<List<Ideas>>(
                      future: data_prod,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.data[index].period,
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
                    Text(
                      'Срок идеи',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Color.fromRGBO(203, 207, 212, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              thickness: 1,
              height: 15,
              color: Color.fromRGBO(203, 207, 212, 1),
            ),
          ],
        ),

        onPressed: () => Navigator.push(context, MaterialPageRoute( builder: (context) => Idea(id: prod,))),
        // onPressed: () => {},
      ),
    );
  }
}