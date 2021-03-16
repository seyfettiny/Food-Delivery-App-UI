import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/models/user_model.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            index % 4 == 0
                ? buildLiveWidget()
                : ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: userList[index].imgUrl,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      height: 100,
                      width: 100,
                    ),
                  ),
            Text(userList[index].name)
          ],
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
              child: CachedNetworkImage(
                imageUrl: userList[index].imgUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(Icons.error),
                height: 100,
                width: 100,
              ),
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
