import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/bloc/BlocPost.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 50),
      child: Provider.of<CartModel>(context).items.isEmpty
          ? Column(
              children: [
                Text(
                  'Nothing in cart',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Add items to cart',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.blue,
                        size: 20,
                      ),
                    ),
                  ],
                )
              ],
            )
          : Column(
              children: [
                Text(
                  'Hey there check \nyour Items in cart',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.74,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Quantity',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Price',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height:
                            (MediaQuery.of(context).size.height * 0.74) - 100,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width,
                              child: Consumer<CartModel>(
                                builder: (context, cart, child) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text('${cart.items[index].name}'),
                                    ),
                                    Text('${cart.items[index].quantity}'),
                                    SizedBox(
                                      width: 200,
                                    ),
                                    Text(
                                        '${cart.quantity(index) * cart.unitPrice}'),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount:
                              Provider.of<CartModel>(context).items.length,
                        ),
                      ),
                      Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Price"),
                          Text(
                              "${Provider.of<CartModel>(context, listen: false).totalPrice}"),
                          GestureDetector(
                            onTap: () {
                              Provider.of<CartModel>(context).clearItem();
                            },
                            child: Container(
                              height: 50,
                              width: 130,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  'Clear Cart',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                )
              ],
            ),
    ));
  }
}
