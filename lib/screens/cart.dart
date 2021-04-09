import 'package:flutter/material.dart';
import 'package:foodies/data/data.dart';
import 'package:foodies/models/order.dart';
import 'package:foodies/styles/constant.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double _totalprice = 0;

    currentUser.cart.forEach((cartItem) {
      _totalprice += cartItem.quantity * cartItem.food.price;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart (${currentUser.cart.length})"),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: currentUser.cart.length + 1,
        itemBuilder: (_, index) {
          if (index < currentUser.cart.length) {
            Order order = currentUser.cart[index];
            return _buildCartOrders(
                buildContext: _, order: order, itemCount: order.quantity);
          } else {
            return Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Estimated Dilivery Time:",
                          style: kTextStyle(15, FontWeight.w600)),
                      Text("25 min", style: kTextStyle(15, FontWeight.w600))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total Cost:",
                          style: kTextStyle(15, FontWeight.w600)),
                      Text("\$${_totalprice.toStringAsFixed(2)}",
                          style: kTextStyle(15, FontWeight.w600,
                              color: Colors.green)),
                    ],
                  ),
                  SizedBox(height: 80.0),
                ],
              ),
            );
          }
        },
        separatorBuilder: (_, index) {
          return Divider(
            color: Colors.grey,
          );
        },
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        constraints: BoxConstraints(maxHeight: 80.0, minHeight: 50.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35.0),
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Center(
          child: TextButton(
            child: Text(
              "CHECKOUT",
              style: kTextStyle(22, FontWeight.bold,
                  color: Colors.white, letterSpacing: 15.0),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  _buildCartOrders(
      {@required BuildContext buildContext, Order order, int itemCount}) {
    int _itemsCount = itemCount;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  height: 100.0,
                  width: 130.0,
                  image: AssetImage(order.food.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Text(
                        order.food.name,
                        style: kTextStyle(20, FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      new SizedBox(height: 10.0),
                      new Text(
                        order.restaurant.name,
                        style: kTextStyle(16, FontWeight.bold),
                        overflow: TextOverflow.clip,
                      ),
                      new SizedBox(height: 10.0),
                      Container(
                        constraints:
                            BoxConstraints(maxWidth: 110, minWidth: 100),
                        padding: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0),
                            borderRadius: BorderRadius.circular(25.0)),
                        height: 30.0,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              iconSize: 20.0,
                              color: Theme.of(context).primaryColor,
                              padding: EdgeInsets.only(bottom: 1.0),
                              onPressed: () {},
                            ),
                            Text("$_itemsCount"),
                            IconButton(
                              icon: Icon(Icons.add),
                              color: Theme.of(context).primaryColor,
                              padding: EdgeInsets.only(bottom: 1.0),
                              iconSize: 20.0,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new Text(
                "\$${order.food.price * order.quantity}",
                style: kTextStyle(16, FontWeight.bold),
                overflow: TextOverflow.clip,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
