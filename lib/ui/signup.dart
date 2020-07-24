import 'package:flutter/material.dart';

import 'login.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  Widget _buildLoginBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
        print('Register Button Pressed');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: new Text(
              "Already have account?",
              style:new TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: new Text(
              "\tLogin here",
              style:new TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14.0,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    String _email;
    String _password;
    String _username;

    bool _isHidePassword = true;

    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0,color:Colors.white);

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.lightBlue,
      child: MaterialButton(
        splashColor: Colors.white,
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            print("Your name: $_username and Your email: $_email and Password: $_password");
          }
          print("Login Success!");
        },
        child: Text("LOGIN",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        body: Container(
          child: Container(
            padding: EdgeInsets.only(top: 40.0),
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/background.jpg"),
                    fit: BoxFit.cover
                )
            ),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 110.0,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Image.asset(
                          "images/koompi_logos.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Container(
                        child: new Theme(
                          data: new ThemeData(
                            primaryColor: Colors.white,
                            primaryColorDark: Colors.white70,
                          ),
                          child: TextFormField(
                            style: style,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "Full Name",
                                prefixIcon: Icon(Icons.child_care,color: Colors.white70),
                                border:
                                OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val){
                              if (val.length == 0)
                                return "Please enter fullname";
                              else if (!val.contains(" "))
                                return "Please enter space after last name";
                              else
                                return null;
                            },
                            onSaved: (val)=>_email=val,
                          ),
                        )
                    ),
                    SizedBox(height: 20.0),

                    Container(
                        child: new Theme(
                          data: new ThemeData(
                            primaryColor: Colors.white,
                            primaryColorDark: Colors.white70,
                          ),
                          child: TextFormField(
                            style: style,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                hintText: "Email",
                                prefixIcon: Icon(Icons.alternate_email,color: Colors.white70),
                                border:
                                OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val){
                              if (val.length == 0)
                                return "Please enter email";
                              else if (!val.contains("@"))
                                return "Please enter valid email";
                              else
                                return null;
                            },
                            onSaved: (val)=>_email=val,
                          ),
                        )
                    ),

                    SizedBox(height: 20.0),
                    Container(
                        child: new Theme(
                          data: new ThemeData(
                            primaryColor: Colors.white,
                            primaryColorDark: Colors.white70,
                          ),
                          child: TextFormField(
                            style: style,
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            initialValue: '',
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              hintText: "Password",
                              fillColor: Colors.white,
                              prefixIcon: Icon(Icons.lock_outline,color: Colors.white70),
                              suffixIcon: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    _isHidePassword != _isHidePassword;
                                  });
                                  print("Hello world");
                                },
                                child: Icon(
                                  _isHidePassword ? Icons.visibility_off : Icons.visibility,
                                ),
                              ),
                              isDense: true,
                              border:
                              OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            obscureText: _isHidePassword,
                            validator: (val){
                              if (val.length == 0)
                                return "Please enter password";
                              else if (val.length <= 5)
                                return "Your password should be more then 6 char long";
                              else
                                return null;
                            },
                            onSaved: (val)=>_password=val,

                          ),
                        )
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0,),
                      child: Column(
                        children: <Widget>[
                          Container(
                              child: _buildLoginBtn(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

