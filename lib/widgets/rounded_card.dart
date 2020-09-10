import 'package:flutter/material.dart';

class RoundedCard extends StatelessWidget {
  final GestureTapCallback onPressed;
  final Widget child;
  final double borderRadius;
  final double padding;
  final EdgeInsets margin;

  RoundedCard({
    Key key,
    this.onPressed,
    @required this.child,
    this.borderRadius = 4,
    this.padding = 12,
    this.margin = const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, 8),
            blurRadius: 24.0,
          )
        ],
      ),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: child,
        ),
      ),
    );
  }
}
