import 'package:flutter/material.dart';
import 'package:foodies/Widgets/rating.dart';
import 'package:foodies/data/data.dart';
import 'package:foodies/screens/restaurant_screen.dart';
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
        _buildRestaurants(buildContext: context),
      ],
    );
  }

  _buildRestaurants({@required BuildContext buildContext}) {
    List<Widget> _restaurantList = [];
    restaurants.forEach((restaurant) {
      _restaurantList.add(
        GestureDetector(
          onTap: () => Navigator.push(
            buildContext,
            MaterialPageRoute(
              builder: (_) => RestaurantScreen(
                restaurant: restaurant,
              ),
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.greenAccent),
              // color: Colors.blue,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    height: 130.0,
                    width: 130.0,
                    image: AssetImage(restaurant.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        new Text(
                          restaurant.name,
                          style: kTextStyle(20, FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Ratings(rating: restaurant.rating),
                        new Text(
                          restaurant.address,
                          style: kTextStyle(16, FontWeight.bold),
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: _restaurantList,
    );
  }
}
