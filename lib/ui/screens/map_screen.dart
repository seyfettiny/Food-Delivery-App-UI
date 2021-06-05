import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
          child: Center(
              child: Column(
            children: [
              Text('MapScreen'),
              Container(
                height: 155,
                width: 300,
                margin: EdgeInsets.symmetric(horizontal: 14),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade800,
                  highlightColor: Colors.grey.shade700,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Color(0xff33343b),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
