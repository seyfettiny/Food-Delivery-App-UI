import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          stops: [0.0, 1.0],
          colors: [
            Color(0xff161a1e),
            Color(0xff25292d),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: null,
        body: Container(
          child: Center(child: Text('MapScreen')),
        ),
      ),
    );
  }
}
