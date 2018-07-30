import 'package:flutter/material.dart';


///
/// A Container that can be used in a Stack that can be clicked and dragged to resize it
/// 
class VerticalDragContainer extends StatefulWidget {

  final double minHeight;
  final double startHeight;
  final Widget child;
  final backgroundColor;

  const VerticalDragContainer({@required this.startHeight,@required this.minHeight, @required this.child, this.backgroundColor});

  _VerticalDragContainerState createState()=>_VerticalDragContainerState();

}



class _VerticalDragContainerState extends State<VerticalDragContainer> {

  var _currentHeight;
  var _startHeight;
  var _startDy;

  @override
  void initState() {
    super.initState();
    _currentHeight = widget.startHeight;
  }

  @override
  Widget build(BuildContext context){

    return Container(
      color: widget.backgroundColor,
      height: _currentHeight, 
      child: Column(
        children: <Widget>[

          /// This is the bar used to pull the container up and down
          GestureDetector(
            onVerticalDragStart: (s) {
              _startDy = s.globalPosition.dy;
              _startHeight = _currentHeight;
            },
            onVerticalDragUpdate: (a) {
              var _currentDy = a.globalPosition.dy;
              var newHeight = _startDy - _currentDy;
              setState(() {
                if((_startHeight + newHeight)>=  widget.minHeight){
                  _currentHeight = (_startHeight + newHeight);
                }
              });
            },
            child: Container(
              height: 10.0,
              color: Colors.green,
            ),
          ),

          /// This is the child widget container
          Expanded(
            child: SingleChildScrollView(
              child: widget.child,
            )
          ) 

        ],
      ),    
    );

  }

}
