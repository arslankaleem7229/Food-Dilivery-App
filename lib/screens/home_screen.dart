import 'package:flutter/material.dart';
import 'package:foodies/Widgets/nearby_restaurants.dart';
import 'package:foodies/Widgets/recent_orders.dart';
import 'package:foodies/data/data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foodies'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.account_circle, size: 30.0),
          onPressed: () => print("Icon Account Circle"),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Cart(${currentUser.cart.length})",
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 15.0, bottom: 15.0, left: 10.0, right: 10.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                hintText: "Find Food or Restaurant",
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.close),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
              ),
            ),
          ),
          RecentOrders(),
          NearbyRestaurants(),
        ],
      ),
    );
  }
}
