import 'package:flutter/material.dart';
import 'package:dragview/dragable.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(title: Text("VerticalDragContainer Demo")),
        body: TestStack()
      ),
    );
  }
}



class TestStack extends StatelessWidget {

  @override
  Widget build(BuildContext context){

    return Stack(
      children: <Widget>[

        Material(
          elevation: 10.0,
          type: MaterialType.canvas,
          shadowColor: Colors.green,
          color: Colors.deepPurpleAccent,
          child: Center(
            child: Text("Hello")
          )
        ),

        Align(
          alignment: Alignment.bottomCenter,

          child: VerticalDragContainer(
            backgroundColor: Colors.white,
            startHeight: 100.0,
            minHeight: 50.0,
            child:  Column(

              children: <Widget>[
                SizedBox(height:10.0),
                FlutterLogo(),
                Text("Hello this is some text"),
                SizedBox(height:10.0),
                Text("Hello this is more text"),
                SizedBox(height:10.0),
                Text("Hello this is more text"),
                SizedBox(height:10.0),
                Text("Hello this is more text"),
                SizedBox(height:10.0),
                Text("Hello this is the last text"),
                SizedBox(height:10.0),
                FlutterLogo(),
                SizedBox(height:10.0),
                RaisedButton(
                  onPressed: () {},
                  child: Text("This is a Button"),
                )
              ],

            )
          )
        )

      ],

    );

  }
}
