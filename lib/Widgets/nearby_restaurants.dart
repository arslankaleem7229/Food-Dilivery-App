import 'package:flutter/material.dart';
import 'package:foodies/data/data.dart';
import 'package:foodies/models/order.dart';
import 'package:foodies/styles/constant.dart';

class NearbyRestaurants extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Nearby Restaurants",
            style: kTextStyle(20.0, FontWeight.w600, letterSpacing: 1.2),
          ),
        ),
        Container(
          height: 120,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (context, index) {
              Order order = currentUser.orders[index];
              return buildNearbyRestaurants(order: order, context: context);
              // return
            },
          ),
        )
      ],
    );
  }

  buildNearbyRestaurants(
      {@required Order order, @required BuildContext context}) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image(
              height: 120.0,
              width: 100.0,
              image: AssetImage(order.food.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          // SizedBox(width: 10.0),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.food.name,
                  style: kTextStyle(20, FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.0),
                Text(
                  order.restaurant.name,
                  style: kTextStyle(16, FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.0),
                Text(
                  order.date,
                  style: kTextStyle(16, FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Icon(
              Icons.add_circle,
              size: 50.0,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
