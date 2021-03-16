import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/widgets/custom_button.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  GlobalKey<AnimatedListState> _key = GlobalKey();
  int _index;
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
          body: LimitedBox(
            child: AnimatedList(
                initialItemCount: cartItems.length,
                key: _key,
                itemBuilder: (context, index, animation) {
                  Cart cartItem = cartItems[index];
                  var tempCartItem;
                  return Dismissible(
                    key: Key(cartItems[index].food.name),
                    background: Container(
                      color: Colors.red,
                      child: Center(
                          child: Icon(Icons.remove_shopping_cart_outlined)),
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        _index = index;
                        tempCartItem = cartItems[index];
                        cartItems.removeAt(index);
                        _key.currentState
                            .removeItem(index, (_, __) => Container());
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('${cartItem.food.name} dismissed'),
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
                            leading: Image.asset(cartItem.food.imgUrl),
                            title: Text(cartItem.food.name),
                            subtitle: Row(
                              children: [
                                TextButton.icon(
                                  onPressed: () {},
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
                                  onPressed: () {},
                                  icon: Icon(Icons.add),
                                  label: Text(''),
                                ),
                              ],
                            ),
                            trailing:
                                Text('€ ' + cartItem.food.price.toString()),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: Colors.transparent,
      brightness: Brightness.dark,
      centerTitle: true,
      title: Text(title),
      elevation: 0,
      actions: [
        IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                cartItems.removeAt(0);
              });
            })
      ],
    );
  }
}
