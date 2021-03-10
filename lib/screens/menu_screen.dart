import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery_app/widgets/custom_button.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
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
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: buildAppBar(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBarView(
                children: [
                  buildTabBeer(),
                  Text('2'),
                  Text('3'),
                  Text('4'),
                ],
              ),
            ),
            bottomNavigationBar: CustomButton(),
          ),
        ),
      ),
    );
  }

  Widget buildTabBeer() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildSectionTitle('First Meal'),
          buildMealContainer(),
          buildSectionTitle('Hot Meals'),
          buildMealContainer(),
          buildSectionTitle('Pita'),
          buildMealContainer(),
        ],
      ),
    );
  }

  Container buildMealContainer() {
    return Container(
      height: 220,
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 230,
                width: 140,
                margin: EdgeInsets.symmetric(horizontal: 12),
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(10, 15),
                      blurRadius: 15,
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Padding buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      brightness: Brightness.dark,
      centerTitle: true,
      actions: [
        IconButton(
          icon: FaIcon(FontAwesomeIcons.shoppingBag),
          onPressed: () {},
        ),
      ],
      title: Text(
        'Menu',
        style: TextStyle(color: Colors.white),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
            isScrollable: true,
            indicatorColor: Colors.deepOrange,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                child: Text(
                  'Beer',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Food',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Wine',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Tab(
                child: Text(
                  'Hot drinks',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
