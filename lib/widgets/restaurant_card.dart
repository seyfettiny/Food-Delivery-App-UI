import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  final String imgUrl;
  final String title;
  const RestaurantCard({Key key, this.imgUrl, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [Color(0xff181a1b), Color(0xff363b40)]),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(5, 10),
                blurRadius: 10,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://images.unsplash.com/photo-1552566626-52f8b828add9?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
                  fit: BoxFit.fitWidth,
                  width: 230,
                  height: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Restaurant Name',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
