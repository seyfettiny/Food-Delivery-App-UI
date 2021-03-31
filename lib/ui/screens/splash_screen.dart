import 'dart:math';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../main_wrapper.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  VideoPlayerController _playerController;
  var videoList = [
    'assets/videos/1.mp4',
    'assets/videos/2.mp4',
    'assets/videos/3.mp4',
    'assets/videos/4.mp4',
    'assets/videos/5.mp4',
    'assets/videos/6.mp4',
    'assets/videos/7.mp4',
    'assets/videos/8.mp4',
  ];
  String randomVideo() {
    var random = Random();
    return videoList[random.nextInt((videoList.length - 1))];
  }

  @override
  void initState() {
    super.initState();
    _playerController = VideoPlayerController.asset(randomVideo())
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {
          _playerController.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            _playerController.value.isPlaying
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    child: VideoPlayer(
                      _playerController,
                    ),
                  )
                : Container(),
            Container(
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0.3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlutterLogo(
                    size: 70,
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 7, color: Colors.white)),
                    child: Text(
                      'No\nqu\neu\nes',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Text(
                    'No queues,\njust a seamless\nfood experience\nfor you',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => MainWrapper()));
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _playerController.dispose();
  }
}
