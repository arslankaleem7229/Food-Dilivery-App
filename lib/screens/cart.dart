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
    return Scaffold(
        appBar: AppBar(
          title: Text("Cart (${currentUser.cart.length})"),
        ),
        body: ListView.separated(
            itemBuilder: (_, index) {
              Order order = currentUser.cart[index];
              return _buildCartOrders(
                  buildContext: _, order: order, itemCount: order.quantity);
            },
            separatorBuilder: (_, index) {
              return Divider(
                color: Colors.grey,
              );
            },
            itemCount: currentUser.cart.length));
  }

  _buildCartOrders(
      {@required BuildContext buildContext, Order order, int itemCount}) {
    int _itemsCount = itemCount;
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
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
                    constraints: BoxConstraints(maxWidth: 110, minWidth: 100),
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
                  )
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
    );
  }
}
