import 'package:flutter/material.dart';

class Fregement extends StatefulWidget {
  @override
  _FregementState createState() => _FregementState();
}

class _FregementState extends State<Fregement> {
  List<Widget> lists = [
    Container(
      color:Colors.deepOrangeAccent
    ),
    Container(
      color:Colors.cyan,
    ),
    Container(
      color:Colors.deepOrange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          home:Scaffold(
              appBar: AppBar(
              ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DefaultTabController(
                  length: 3,
                  child: Expanded(
                      child: TabBar(
                        labelColor: Colors.deepOrangeAccent,
                        tabs: <Widget>[
                          Tab(
                            icon: Icon(Icons.print),
                            text: 'TabOne',
                          ),
                          Tab(
                            icon: Icon(Icons.print),
                            text: 'TabOne',
                          ),
                          Tab(
                            icon: Icon(Icons.print),
                            text: 'TabOne',
                          )
                        ],
                      )
                  ),
                ),
                Container(
                    child: Expanded(child: TabBarView(children: lists)),
                )
              ],
            )
          )
      ),
    );
  }
}


