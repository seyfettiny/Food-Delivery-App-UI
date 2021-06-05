import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/user_model.dart';
import '../../services/firebase_base.dart';

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
                      ? buildVideoWidget(snapshot.data)
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
          return Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 90,
                  width: 90,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade800,
                    highlightColor: Colors.grey.shade700,
                    child: ClipOval(
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: 90,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.shade800,
                    highlightColor: Colors.grey.shade700,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Stack buildVideoWidget(String url) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        ClipOval(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              border: Border.all(
                color: Colors.deepOrange,
                width: 3,
                style: BorderStyle.solid,
              ),
            ),
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
