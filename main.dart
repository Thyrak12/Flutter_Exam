import 'package:flutter/material.dart';
import 'package:w4_app/final/models/restaurant_comment.dart';

import 'models/restaurant.dart';
import 'models/restaurant_type.dart';
import 'ui/screens/restaurants_view.dart';
import 'ui/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.main,
      debugShowCheckedModeBanner: false,
      home: RestaurantsView(restaurants: allRestaurants),
    );
  }

  List<RestaurantComment> get allComment {
    List<RestaurantComment> comment = [
      RestaurantComment(star: 5, cmt: 'This is Good'),
      RestaurantComment(star: 2, cmt: 'This is Bad'),
      RestaurantComment(star: 4, cmt: 'Wow'),
      RestaurantComment(star: 5, cmt: 'Love'),
    ];
    return comment;
  }

  List<Restaurant> get allRestaurants {
    List<Restaurant> result = [
      Restaurant(
        name: 'Flutter Burger',
        address: 'Street 174, Phnom Penh',
        type: RestaurantType.khmer,
        comment: allComment
      ),
      
      Restaurant(
        name: 'Les croissants de Ronan',
        address: 'Sisowath Quay, Phnom Penh',
        type: RestaurantType.french,
        comment: allComment
      ),
      
      Restaurant(
        name: 'La Pizza Del Ronano (the best)',
        address: 'BKK1, Phnom Penh',
        type: RestaurantType.italian,
        comment: allComment
      ),
      
      Restaurant(
        name: 'Final Tacos',
        address: 'Street Exam, Phnom Penh',
        type: RestaurantType.mexican,
        comment: allComment
      ),
      Restaurant(
        name: 'No money no Rice',
        address: 'BKK1, Phnom Penh',
        type: RestaurantType.streetfood,
        comment: allComment
      ),

       Restaurant(
        name: 'Ronano the Besto',
        address: 'CADT, Phnom Penh',
        type: RestaurantType.khmer,
        comment: allComment
      ),
       
    ];
    return result;
  }
}
