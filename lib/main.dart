import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/ui/screens/splash_screen.dart';

void main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
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
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
        print('initialization error:' + e.toString());
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Text('Something went wrong'),
      );
    }
    if (!_initialized) {
      return CircularProgressIndicator();
    }
    return SplashScreen();
  }
}
