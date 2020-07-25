import 'package:flutter/material.dart';

Widget _forgotPassword() {
  return GestureDetector(
    onTap: () {
      print("You are forgot password");
    },
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: new Text(
            "Forgot Password?",
            style:new TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
        )
      ],
    ),
  );
}