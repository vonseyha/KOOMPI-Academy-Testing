import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0,);
    final emailField = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          )
      ),
    );

    final passField = TextField(
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          fillColor: Colors.white,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          print("Login Success!");
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Container(
            padding: EdgeInsets.only(top: 40.0),
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/Image_icon/background.jpg"),
                    fit: BoxFit.cover
                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 110.0,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Image.asset(
                        "assets/Image_icon/koompi_logos.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  emailField,
                  SizedBox(height: 35.0),
                  passField,
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: new Text(
                            "Forgot Password",
                            style: new TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 150.0),
                        child: SizedBox(
                          child: new Text(
                            "Register!",
                            style: new TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  loginButon,
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal:100.0),
                    child:Container(
                      margin: EdgeInsets.only(top: 20.0,right: 10.0),
                      height:2.0,
                      color:Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:40.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          padding:EdgeInsets.all(10.0),
                          child:RaisedButton.icon(
                            onPressed: (){ print('Login  with Google');
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5.0)
                                )
                            ),
                            label: Text('Google',
                              style: TextStyle(color: Colors.white),
                            ),
                            icon: Icon(
                              Icons.backup,
                              color:Colors.white,
                            ),
                            textColor: Colors.white,
                            splashColor: Colors.white,
                            color: Colors.lightBlue,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          padding:EdgeInsets.all(10.0),
                          child: RaisedButton.icon(
                            onPressed: (){
                              print("Login with Feacbook");
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                )
                            ),
                            label: Text("Feacbook",style: TextStyle(color: Colors.white),),
                            icon: Icon(
                              Icons.filter_drama,
                              color: Colors.white,
                            ),
                            textColor: Colors.white,
                            splashColor: Colors.white,
                            color: Colors.lightBlue,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
