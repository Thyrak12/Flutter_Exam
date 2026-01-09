import 'package:w4_app/final/models/restaurant_comment.dart';

import 'restaurant_type.dart';

class Restaurant {
  final String name;
  final String address;
  final RestaurantType type;
  final List<RestaurantComment> comment;
 
  Restaurant({required this.name, required this.address, required this.type, required this.comment});

  double getAverage(){
    int sum = 0;
    int count = 0;
    for (RestaurantComment cmt in comment){
      count++;
      sum += cmt.star;
    }
    double average = sum/count;
    return average;
  }
}
