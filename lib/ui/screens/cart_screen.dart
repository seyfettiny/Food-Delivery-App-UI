import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/services/firebase_base.dart';
import 'package:food_delivery_app/ui/widgets/custom_button.dart';

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
    // TODO: implement initState
    super.initState();
    _cartRef = firebaseDatabase.reference().child('cart');
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
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(context, 'Checkout Order'),
          bottomNavigationBar: CustomButton(
            text: 'Checkout',
          ),
          body: FutureBuilder(
              future: firebaseBaseClass.fetchCart(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var cartItems = snapshot.data;
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    child: AnimatedList(
                        initialItemCount: cartItems.length,
                        shrinkWrap: true,
                        key: _key,
                        itemBuilder: (context, index, animation) {
                          Cart cartItem = cartItems[index];
                          var tempCartItem;
                          return Dismissible(
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
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    Text('${cartItem.food.name} dismissed'),
                                action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    setState(() {
                                      cartItems.insert(_index, tempCartItem);
                                      _key.currentState.insertItem(_index);
                                    });
                                  },
                                ),
                              ));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: LimitedBox(
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
                                          future: firebaseBaseClass
                                              .downloadFoodImageURL(
                                                  cartItems[index].food.imgUrl),
                                          builder: (context, snapshot) {
                                            print(cartItems[index].food.imgUrl);
                                            if (snapshot.hasData) {
                                              return CachedNetworkImage(
                                                  imageUrl: snapshot.data);
                                            } else {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                          }),
                                      title: Text(cartItem.food.name),
                                      subtitle: Row(
                                        children: [
                                          TextButton.icon(
                                            onPressed: () {
                                              //decreaseCartItemAmount(cartItem,index, cartItem.amount);
                                            },
                                            icon: Icon(Icons.remove),
                                            label: Text(''),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              cartItem.amount.toString(),
                                            ),
                                          ),
                                          TextButton.icon(
                                            onPressed: () {
                                              setState(() {
                                                //increaseCartItemAmount(cartItem,index, cartItem.amount);
                                              });
                                            },
                                            icon: Icon(Icons.add),
                                            label: Text(''),
                                          ),
                                        ],
                                      ),
                                      trailing: Text('€ ' +
                                          cartItem.food.price.toString()),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  print(snapshot.error);
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }

/*
  void increaseCartItemAmount(Cart cart, int index, int amount) async {
    await _cartRef.child('$index').update({
      'amount': amount++,
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
