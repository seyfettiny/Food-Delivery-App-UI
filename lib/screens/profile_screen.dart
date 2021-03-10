import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: 'avatar',
              child: ClipOval(
                child: Image.asset('assets/images/avatar.png'),
              ),
            ),
            Text('ProfileScreen'),
          ],
        ),
      ),
    );
  }
}
