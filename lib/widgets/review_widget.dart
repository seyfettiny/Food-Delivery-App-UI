import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  final int index;
  const ReviewWidget({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {},
        child: index % 4 == 0
            ? buildLiveWidget()
            : ClipOval(
                child: Image.asset("assets/images/avatar.png"),
              ),
      ),
    );
  }

  Stack buildLiveWidget() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        ClipOval(
          child: Container(
            color: Colors.deepOrange,
            padding: EdgeInsets.all(2),
            child: ClipOval(
              child: Image.asset("assets/images/avatar.png"),
            ),
          ),
        ),
        Positioned(
          bottom: -4,
          child: Container(
            color: Colors.deepOrange,
            child: Text(
              "LIVE",
              style: TextStyle(color: Colors.white, fontSize: 9),
            ),
          ),
        ),
      ],
    );
  }
}
