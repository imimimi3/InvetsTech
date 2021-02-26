import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final Widget goTo;
  final Color color;

  Button({Key key, this.title, this.goTo, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => goTo)),
      child: Container(
        // margin: const EdgeInsets.symmetric(
        //   horizontal: 50.0,
        //   vertical: 5.0,
        // ),
        // width: double.infinity,
        padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10),
        decoration: BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black,
            //     blurRadius: 10.0,
            //     offset: Offset(1.0, 1.0),
            //   ),
            // ],
            borderRadius: BorderRadius.circular(30.0),
            color: color,
        ),
        child: Container(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}