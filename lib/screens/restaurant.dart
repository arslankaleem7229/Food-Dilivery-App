import 'package:flutter/material.dart';
import 'package:foodies/Widgets/rating.dart';
import 'package:foodies/models/food.dart';
import 'package:foodies/models/restaurant.dart';
import 'package:foodies/styles/constant.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantScreen({this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage(restaurant.imageUrl),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.33,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.amber,
                  Colors.amberAccent,
                  Colors.white,
                ],
              ),
            ),
            height: MediaQuery.of(context).size.height / 6,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    new Text(
                      restaurant.name,
                      style: kTextStyle(24.0, FontWeight.bold),
                    ),
                    new Text(
                      "0.2 miles away",
                      style: kTextStyle(14.0, FontWeight.normal),
                    ),
                  ],
                ),
                Ratings(rating: restaurant.rating),
                new Text(
                  restaurant.address,
                  style: kTextStyle(18.0, FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildElevatedButton(context: context, text: "Reviews"),
                _buildElevatedButton(context: context, text: "Contact"),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            "Menu",
            style: kTextStyle(22.0, FontWeight.w600, letterSpacing: 1.2),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                restaurant.menu.length,
                (index) {
                  Food food = restaurant.menu[index];
                  return _buildMenuItems(
                      buildContext: context, menuItems: food);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  ElevatedButton _buildElevatedButton({BuildContext context, String text}) {
    return ElevatedButton(
      onPressed: () {},
      child: Container(
        child: Text(text),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
      ),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).primaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Stack _buildMenuItems(
      {@required BuildContext buildContext, @required Food menuItems}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 175,
          height: 175,
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
                image: AssetImage(menuItems.imageUrl), fit: BoxFit.cover),
          ),
        ),
        Container(
          width: 175,
          height: 175,
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black87.withOpacity(0.3),
                Colors.black54.withOpacity(0.3),
                Colors.black38.withOpacity(0.3),
              ],
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              menuItems.name,
              style: kTextStyle(28.0, FontWeight.w900, color: Colors.white),
              overflow: TextOverflow.clip,
            ),
            Text(
              "\$${menuItems.price}",
              style: kTextStyle(20.0, FontWeight.w900, color: Colors.white),
            ),
          ],
        ),
        Positioned(
          right: 5.0,
          bottom: 5.0,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_circle_outlined),
            iconSize: 50.0,
            color: Theme.of(buildContext).primaryColor,
          ),
        )
      ],
    );

    //
  }
}
