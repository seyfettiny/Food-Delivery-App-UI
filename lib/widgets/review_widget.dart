import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                child: Image.asset('assets/images/user/avatar.png'),
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
              child: Image.asset('assets/images/user/avatar.png'),
            ),
          ),
        ),
        Positioned(
          bottom: -6,
          child: Container(
            padding: EdgeInsets.fromLTRB(6, 4, 6, 4),
            color: Colors.deepOrange,
            child: Icon(
              FontAwesomeIcons.play,
              color: Colors.white,
              size: 10,
            ),
          ),
        ),
      ],
    );
  }
}
