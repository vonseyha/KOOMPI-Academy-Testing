import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Expansion List'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  width: 500.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFeff1f2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: new Text(
                      'COURSE CONTENT',
                      style: new TextStyle(
                        fontFamily: 'Quicksand,sans-serif',
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height:10.0,),
              Expanded(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFeff1f2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) => EntryItem(data[index],),
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Welcome to another flutter tutorial
// In this video we will see how to create a multi-level Expansion List
// First Let's create a class for each row in the Expansion List

class Entry {
  final String title;
  final List<Entry>
  children; // Since this is an expansion list ...children can be another list of entries
  Entry(this.title, [this.children = const <Entry>[]]);
}

// This is the entire multi-level list displayed by this app
final List<Entry> data = <Entry>[
  Entry(
    'Chapter A',
    <Entry>[
      Entry(
        'Section A0',
        <Entry>[
          Entry('Item A0.1'),
          Entry('Item A0.2'),
          Entry('Item A0.3'),
        ],
      ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  // Second Row
  Entry('Chapter B', <Entry>[
    Entry('Section B0'),
    Entry('Section B1'),
  ]),
  Entry(
    'Chapter C',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
      Entry(
        'Section C2',
        <Entry>[
          Entry('Item C2.0'),
          Entry('Item C2.1'),
          Entry('Item C2.2'),
          Entry('Item C2.3'),
        ],
      )
    ],
  ),
];

// Create the Widget for the row
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);
  final Entry entry;

  // This function recursively creates the multi-level list rows.
  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.title),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}