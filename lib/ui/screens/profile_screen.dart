import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/models/user_model.dart';
import 'package:food_delivery_app/services/firebase_base.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firebaseBaseClass = FirebaseBaseClass();
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
        appBar: buildAppBar(),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder(
                  future: firebaseBaseClass.downloadUserImageURL(user.imgUrl),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Hero(
                        tag: 'avatar${snapshot.data}',
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: snapshot.data,
                            progressIndicatorBuilder:
                                (context, url, progress) =>
                                    CircularProgressIndicator(
                              value: progress.progress,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            width: 120,
                          ),
                        ),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  user.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: FaIcon(FontAwesomeIcons.instagram),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      brightness: Brightness.dark,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: FaIcon(FontAwesomeIcons.cog),
          onPressed: () {},
        ),
      ],
      title: Text(
        'My Profile',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
