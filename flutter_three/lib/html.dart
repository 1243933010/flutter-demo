import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// Uncomment lines 7 and 10 to view the visual layout at runtime.
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          // Icon(
          //   Icons.star,
          //   color: Colors.red[500],
          // ),
          // Text(
          //   '41',
          //   style:TextStyle(
          //     fontSize: 16,
          //     color: Colors.black
          //   )
          // ),
          new FavoriteWidget(),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.'
            'enjoyed here include rowing, and riding the summer toboggan run.'
            'enjoyed here include rowing, and riding the summer toboggan run.'
            'enjoyed here include rowing, and riding the summer toboggan run.'
            'enjoyed here include rowing, and riding the summer toboggan run.'
            'enjoyed here include rowing, and riding the summer toboggan run.'
            'enjoyed here include rowing, and riding the summer toboggan run.'
            'enjoyed here include rowing, and riding the summer toboggan run.'
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: ListView(
            children: [
              Image.asset(
                'images/bk.png',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection,
              new TapboxA(),
              new TapboxB(active:false,onChanged:null),
            ]
        ),

      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 10;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount--;
        _isFavorited = false;
      } else {
        _favoriteCount++;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
              icon: (_isFavorited
                  ? new Icon(Icons.star)
                  : new Icon(Icons.star_border)),
              color: Colors.red[500],
              onPressed: _toggleFavorite),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
            color: Colors.white,
            child: new Center(
              child: new Text(
                '$_favoriteCount',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ),
        )
      ],
    );
  }
}


// TapboxA 管理自身状态.

//------------------------- TapboxA ----------------------------------

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        // width: 0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}

// ParentWidget 为 TapboxB 管理状态.

//------------------------ ParentWidget --------------------------------

class ParentWidget extends StatefulWidget{
  @override
  _ParentWidgetState createState()=>new _ParentWidgetState();
}
class _ParentWidgetState extends State<ParentWidget>{
  bool _active = false;
  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new TapboxB(
          active:_active,
          onChanged:_handleTapboxChanged
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------
class TapboxB extends StatelessWidget{
  TapboxB({Key key,this.active:false,@required this.onChanged}):super(key:key);
  final bool active;
  final ValueChanged<bool> onChanged;
  void _handleTap(){
    onChanged(!active);
  }
  Widget build(BuildContext context){
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active?'Active':'Inactive',
            style: new TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
            color: active?Colors.lightGreen[700]:Colors.grey[600]
        ),
      ),
    );
  }
}