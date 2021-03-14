import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/screens/home_screen.dart';
import 'package:food_delivery_app/screens/map_screen.dart';
import 'package:food_delivery_app/screens/mylist_screen.dart';
import 'package:food_delivery_app/screens/search_screen.dart';
import 'package:food_delivery_app/screens/voice_search_screen.dart';

void main() {
  Paint.enableDithering = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.deepOrange,
        primarySwatch: Colors.deepOrange,
        hintColor: Colors.white,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Gilroy',
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      home: MyAppContainer(),
    );
  }
}

class MyAppContainer extends StatefulWidget {
  MyAppContainer({Key key}) : super(key: key);

  @override
  _MyAppContainerState createState() => _MyAppContainerState();
}

class _MyAppContainerState extends State<MyAppContainer> {
  int _selectedIndex = 0;
  PageController _pageController;
  List<String> appBarTitles = [
    'Home',
    'Search',
    'My List',
    'Map',
    'Voice Search'
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            SafeArea(child: HomeScreen()),
            SafeArea(child: SearchScreen()),
            SafeArea(child: MyListScreen()),
            SafeArea(child: MapScreen()),
            SafeArea(child: VoiceSearchScreen()),
          ],
        ),
        bottomNavigationBar: bottomNavigationBar(),
      ),
    );
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xff2c3136),
      unselectedItemColor: Color(0xff535c65),
      selectedItemColor: Color(0xfffb531a),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex,
      onTap: (index) {
        if (index != _selectedIndex) {
          setState(() {
            _selectedIndex = index;
            _pageController.jumpToPage(
              index,
            );
          });
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.solidHeart),
          label: 'My List',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.mapMarker),
          label: 'Location',
        ),
        BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.microphoneAlt),
          label: 'Mic',
        ),
      ],
    );
  }
}
