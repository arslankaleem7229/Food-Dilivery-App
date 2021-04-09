import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  static String stars = " ";
  final int rating;
  Ratings({@required this.rating});
  @override
  Widget build(BuildContext context) {
    stars = _buildRating(rating: rating);
    return Container(
      height: 20.0,
      child: Text("$stars"),
    );
  }
}

String _buildRating({int rating}) {
  String stars = "";
  for (var i = 0; i < rating; i++) {
    stars += "⭐";
  }
  return stars;
}
