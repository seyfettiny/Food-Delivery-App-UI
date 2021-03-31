import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../models/user_model.dart';
import '../../models/chip_model.dart';
import '../../services/firebase_base.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  const ProfileScreen({Key key, this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //ChipModel chipModel = ChipModel();
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
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder(
                    future: firebaseBaseClass
                        .downloadUserImageURL(widget.user.imgUrl),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Hero(
                          tag: 'homeavatar${snapshot.data}',
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: snapshot.data,
                              memCacheHeight: 120,
                              memCacheWidth: 120,
                              progressIndicatorBuilder:
                                  (context, url, progress) =>
                                      CircularProgressIndicator(
                                value: progress.progress,
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
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
                    widget.user.name,
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
                        icon: FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.googlePlus,
                          color: Colors.grey,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Diet',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Wrap(
                        spacing: 6.0,
                        runSpacing: -10.0,
                        children: [
                          buildFilterChip(0, ChipModel.diet),
                          buildFilterChip(1, ChipModel.diet),
                          buildFilterChip(2, ChipModel.diet),
                          buildFilterChip(3, ChipModel.diet),
                          buildFilterChip(4, ChipModel.diet),
                          buildFilterChip(5, ChipModel.diet),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Food Choice',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Food love'),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Wrap(
                              spacing: 6.0,
                              runSpacing: -10.0,
                              crossAxisAlignment: WrapCrossAlignment.end,
                              children: [
                                buildFilterChip(0, ChipModel.foodLove),
                                buildFilterChip(1, ChipModel.foodLove),
                                buildFilterChip(2, ChipModel.foodLove),
                                buildFilterChip(3, ChipModel.foodLove),
                                buildFilterChip(4, ChipModel.foodLove),
                                buildFilterChip(5, ChipModel.foodLove),
                                buildFilterChip(6, ChipModel.foodLove),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text('Food hate'),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Wrap(
                              spacing: 6.0,
                              runSpacing: -10.0,
                              crossAxisAlignment: WrapCrossAlignment.end,
                              children: [
                                buildFilterChip(0, ChipModel.foodHate),
                                buildFilterChip(1, ChipModel.foodHate),
                                buildFilterChip(2, ChipModel.foodHate),
                                buildFilterChip(3, ChipModel.foodHate),
                                buildFilterChip(4, ChipModel.foodHate),
                                buildFilterChip(5, ChipModel.foodHate),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text('No food'),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Wrap(
                              spacing: 6.0,
                              runSpacing: -10.0,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: [
                                buildFilterChip(0, ChipModel.noFood),
                                buildFilterChip(1, ChipModel.noFood),
                                buildFilterChip(2, ChipModel.noFood),
                                buildFilterChip(3, ChipModel.noFood),
                                buildFilterChip(4, ChipModel.noFood),
                                buildFilterChip(5, ChipModel.noFood),
                                buildFilterChip(6, ChipModel.noFood),
                                buildFilterChip(7, ChipModel.noFood),
                                buildFilterChip(8, ChipModel.noFood),
                                buildFilterChip(9, ChipModel.noFood),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Favourite Cuisines',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Wrap(
                        spacing: 6.0,
                        runSpacing: -10.0,
                        children: [
                          buildFilterChip(0, ChipModel.favCuisines),
                          buildFilterChip(1, ChipModel.favCuisines),
                          buildFilterChip(2, ChipModel.favCuisines),
                          buildFilterChip(3, ChipModel.favCuisines),
                          buildFilterChip(4, ChipModel.favCuisines),
                          buildFilterChip(5, ChipModel.favCuisines),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FilterChip buildFilterChip(int index, List list) {
    return FilterChip(
      selected: list[index].isSelected,
      label: Text(list[index].name),
      labelStyle: TextStyle(color: Colors.white),
      backgroundColor: Colors.black54,
      selectedColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      onSelected: (bool selected) {
        setState(() {
          list[index].isSelected = !list[index].isSelected;
        });
      },
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
