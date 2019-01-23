import 'package:flutter/material.dart';

/// A Container that can be used in a Stack that can be clicked and /or dragged to resize it
/// [minHeight] is the minium height the container will close down when clicked or dragged
/// [startHeight] is the initial height of the container when first created
/// [expandedHeght] is the height the container will grow to if the title bar is clicked
/// [child] is the widget displayed in the the container
/// [backgroundColor] is the main container background colour
/// [barColor] is the background colour of the title bar
/// [iconColor] is the colour of the indicator icon and the titlebar text
/// [title] is the displayed title bar text
class VerticalDragContainer extends StatefulWidget {
  final double minHeight;
  final double startHeight;
  final double expandedHeight;
  final Widget child;
  final Color backgroundColor;
  final Color barColor;
  final Color iconColor;
  final String title;

  const VerticalDragContainer(
      {@required this.startHeight,
      @required this.minHeight,
      @required this.child,
      @required this.expandedHeight,
      this.backgroundColor: Colors.white,
      this.barColor: Colors.blue,
      this.iconColor: Colors.black,
      this.title: "Menu Options"});

  _VerticalDragContainerState createState() => _VerticalDragContainerState();
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
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      height: _currentHeight,
      child: Column(
        children: <Widget>[
          // Top Line
          Container(
            height: 3.0,
            width: double.infinity,
            color: widget.barColor,
          ),

          // This is the 'titlebar' used to pull the container up and down
          // Now it can be tapped or dragged to expand and collapse the overlay
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (_currentHeight <= widget.minHeight) {
                setState(() {
                  _currentHeight = widget.expandedHeight;
                });
              } else {
                setState(() {
                  _currentHeight = widget.minHeight;
                });
              }
            },
            onVerticalDragStart: (s) {
              _startDy = s.globalPosition.dy;
              _startHeight = _currentHeight;
            },
            onVerticalDragUpdate: (a) {
              var _currentDy = a.globalPosition.dy;
              var newHeight = _startDy - _currentDy;
              setState(() {
                if ((_startHeight + newHeight) >= widget.minHeight) {
                  _currentHeight = (_startHeight + newHeight);
                } else {
                  _currentHeight = widget.minHeight;
                }
              });
            },
            child: Row(
              children: <Widget>[
                Icon(
                  (_currentHeight <= widget.minHeight)
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: widget.iconColor,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(widget.title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.title),
                  ),
                ),
              ],
            ),
          ),

          /// This is the child widget container
          Expanded(
              child: SingleChildScrollView(
            child: widget.child,
          ))
        ],
      ),
    );
  }
}
