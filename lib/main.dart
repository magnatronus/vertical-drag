import 'package:flutter/material.dart';
import 'dragable.dart';

/// Simple demo showing the use of the VerticalDragContainer widget
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
          appBar: AppBar(title: Text("VerticalDragContainer Demo")),
          body: TestStack()),
    );
  }
}

class TestStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Material(
            elevation: 10.0,
            type: MaterialType.canvas,
            shadowColor: Colors.green,
            color: Colors.deepPurpleAccent,
            child: Center(child: Text("Hello"))),
        Align(
            alignment: Alignment.bottomCenter,
            child: VerticalDragContainer(
                backgroundColor: Colors.white,
                startHeight: 40.0,
                minHeight: 40.0,
                expandedHeight: 290.0,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10.0),
                    FlutterLogo(),
                    Text("Hello this is some text"),
                    SizedBox(height: 10.0),
                    Text("Hello this is more text"),
                    SizedBox(height: 10.0),
                    Text("Hello this is more text"),
                    SizedBox(height: 10.0),
                    Text("Hello this is more text"),
                    SizedBox(height: 10.0),
                    Text("Hello this is the last text"),
                    SizedBox(height: 10.0),
                    FlutterLogo(),
                    SizedBox(height: 10.0),
                    RaisedButton(
                      onPressed: () {},
                      child: Text("This is a Button"),
                    )
                  ],
                )))
      ],
    );
  }
}
