import 'package:flutter/material.dart';

class SocialRedirect extends StatelessWidget {
  SocialRedirect(
      {@required this.onPressed,
        @required this.toolTipName,
        @required this.imageUrl});

  final GestureTapCallback onPressed;
  final String toolTipName;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.orange[500],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: IconButton(
          hoverColor: Colors.red,
          tooltip: toolTipName,
          icon: Image.asset(
            imageUrl,
          ),
          onPressed: onPressed,
          color: Colors.white,
        ),
      ),
    );
  }
}