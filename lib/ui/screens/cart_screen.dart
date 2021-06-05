import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/cart_model.dart';
import '../../services/firebase_base.dart';
import '../widgets/custom_button.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  GlobalKey<AnimatedListState> _key = GlobalKey();
  FirebaseBaseClass firebaseBaseClass = FirebaseBaseClass();
  int _index;
  //TODO: move this to do firebaseBaseClass
  FirebaseDatabase firebaseDatabase = FirebaseDatabase(
      databaseURL:
          'https://food-delivery-app-c1c8d-default-rtdb.europe-west1.firebasedatabase.app/');
  DatabaseReference _cartRef;
  @override
  void initState() {
    super.initState();
    _cartRef = firebaseDatabase.reference().child('cart');
  }

  String calculateTotalAmount(List items) {
    var tmp = 0;
    for (var item in items) {
      tmp += ((item.amount) * (item.food.price));
    }
    return tmp.toString();
  }

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
        child: FutureBuilder(
            future: firebaseBaseClass.fetchCart(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var cartItems = snapshot.data;
                return Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: buildAppBar(context, 'Checkout Order'),
                  bottomSheet: BottomSheet(
                    onClosing: () {},
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Amount',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '€  ' + calculateTotalAmount(cartItems),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Serve time',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '6:30  PM',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  bottomNavigationBar: CustomButton(
                    text: 'Checkout',
                  ),
                  body: AnimatedList(
                      initialItemCount: cartItems.length,
                      shrinkWrap: true,
                      key: _key,
                      itemBuilder: (context, index, animation) {
                        Cart cartItem = cartItems[index];
                        var tempCartItem;
                        return Container(
                          margin: EdgeInsets.all(12),
                          child: Dismissible(
                            key: Key(cartItems[index].food.name),
                            background: Container(
                              color: Colors.red,
                              child: Center(
                                  child: Icon(
                                      Icons.remove_shopping_cart_outlined)),
                            ),
                            onDismissed: (direction) {
                              setState(() {
                                _index = index;
                                tempCartItem = cartItems[index];
                                cartItems.removeAt(index);
                                _key.currentState
                                    .removeItem(index, (_, __) => Container());
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('${cartItem.food.name} removed'),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {
                                      setState(() {
                                        cartItems.insert(_index, tempCartItem);
                                        _key.currentState.insertItem(_index);
                                      });
                                    },
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff33343b),
                                  borderRadius: BorderRadius.circular(18),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      offset: Offset(15, 10),
                                      blurRadius: 15,
                                    ),
                                  ]),
                              child: SizeTransition(
                                sizeFactor: animation,
                                child: ListTile(
                                  leading: FutureBuilder(
                                    future:
                                        firebaseBaseClass.downloadFoodImageURL(
                                            cartItems[index].food.imgUrl),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return CachedNetworkImage(
                                            maxHeightDiskCache: 70,
                                            maxWidthDiskCache: 70,
                                            imageUrl: snapshot.data);
                                      } else {
                                        return SizedBox(
                                          width: 70,
                                          height: 70,
                                          child: Shimmer.fromColors(
                                            baseColor: Colors.grey.shade800,
                                            highlightColor:
                                                Colors.grey.shade700,
                                            child: ClipOval(
                                              child: Container(
                                                color: Colors.grey,
                                                width: 70,
                                                height: 70,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  title: Text(cartItem.food.name),
                                  subtitle: Row(
                                    children: [
                                      ClipOval(
                                        child: TextButton.icon(
                                          onPressed: () {
                                            //decreaseCartItemAmount(cartItem,index, cartItem.amount);
                                          },
                                          icon: Icon(Icons.remove),
                                          label: Text(''),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          cartItem.amount.toString(),
                                        ),
                                      ),
                                      ClipOval(
                                        child: TextButton.icon(
                                          onPressed: () {
                                            setState(() {
                                              //increaseCartItemAmount( index, cartItem.amount);
                                            });
                                          },
                                          icon: Icon(Icons.add),
                                          label: Text(''),
                                        ),
                                      ),
                                    ],
                                  ),
                                  trailing: Text(
                                      '€ ' + cartItem.food.price.toString()),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

/*
  void increaseCartItemAmount(int index, int amount) async {
    await _cartRef.child('$index').update({
      'amount': amount++,
    }).catchError((error, stackTrace) {
      print(error + stackTrace);
    }).then((_) {
      print('Transaction  committed.');
    });
  }


  void decreaseCartItemAmount(Cart cart, int index, int amount) async {
    await _cartRef.child('$index').update({
      'amount': amount--,
    }).then((_) {
      print('Transaction  committed.');
    });
  }
*/
  AppBar buildAppBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: Colors.transparent,
      brightness: Brightness.dark,
      centerTitle: true,
      title: Text(title),
      elevation: 0,
    );
  }
}
