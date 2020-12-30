import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';

void main() => runApp(new MyApp(

));

class MyApp extends StatelessWidget {
  // final List<String> items;
  // MyApp({Key key, @required this.items}) : super(key: key);
  final items= new List<String>.generate(10, (i) => "Item $i");
  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView(
          children: <Widget>[
            new Image.network(
              'https://www.etcbao.com/chcb/static/images/home-bg.png',
            ),
            new ListTile(
              leading: new Icon(Icons.map),
              title: new Text('Map'),
            ),
            new ListTile(
              leading: new Icon(Icons.photo),
              title: new Text('Album'),
            ),
            new ListTile(
              leading: new Icon(Icons.phone),
              title: new Text('Phone'),
            ),
            new Container(
              margin: new EdgeInsets.symmetric(vertical: 20.0),
              height: 200.0,
              child: new ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  new Container(
                    width: 160.0,
                    color: Colors.red,
                  ),
                  new Container(
                    width: 160.0,
                    color: Colors.blue,
                  ),
                  new Container(
                    width: 160.0,
                    color: Colors.green,
                  ),
                  new Container(
                    width: 160.0,
                    color: Colors.yellow,
                  ),
                  new Container(
                    width: 160.0,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
