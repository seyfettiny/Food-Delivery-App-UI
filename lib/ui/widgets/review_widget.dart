import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/models/user_model.dart';
import 'package:food_delivery_app/services/firebase_base.dart';
import 'package:shimmer/shimmer.dart';

class ReviewWidget extends StatelessWidget {
  final firebaseBaseClass = FirebaseBaseClass();
  final int index;
  final User user;
  ReviewWidget({
    Key key,
    this.index,
    this.user,
  }) : super(key: key);
  //TODO: FutureProvider
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebaseBaseClass.downloadUserImageURL(user.imgUrl),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            margin: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  index % 4 == 0
                      ? buildLiveWidget(snapshot.data)
                      : ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: snapshot.data,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            memCacheHeight: 90,
                            memCacheWidth: 90,
                            height: 90,
                            width: 90,
                          ),
                        ),
                  Text(user.name)
                ],
              ),
            ),
          );
        } else {
          return Shimmer.fromColors(
            baseColor: Colors.red,
            highlightColor: Colors.yellow,
            child: Container(
              height: 90,
              width: 90,
            ),
          );
        }
      },
    );
  }

  Stack buildLiveWidget(String url) {
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
                imageUrl: url,
                errorWidget: (context, url, error) => Icon(Icons.error),
                memCacheHeight: 90,
                memCacheWidth: 90,
                height: 90,
                width: 90,
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
