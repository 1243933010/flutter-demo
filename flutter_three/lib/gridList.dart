import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final title = 'Grid List';
    final list = ['a', 'b', 'c'];
    final gridLen = 3;
    return new MaterialApp(
        title: title,
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text(title),
          ),
          body: new GridView.count(
            crossAxisCount: gridLen,
            children: new List.generate(list.length, (index) {
               final text = list[index];
               final ind = index;
              return new InkWell(
                child: new MyButton(text: text,ind: ind),
              );
            }),
          ),
        ));
  }
}

class MyButton extends StatelessWidget {
  final text ;
  final ind;
  MyButton({Key key, this.text,this.ind}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // The InkWell Wraps our custom flat button Widget
    return new InkWell(
      // When the user taps the button, show a snackbar
      onTap: () {
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text('当前点击索引为$ind')
        ));
      },
      child: new Container(
        padding: new EdgeInsets.all(12.0),
        child: new Center(
          child: new Text(text),
        ),
      ),
    );
  }
}