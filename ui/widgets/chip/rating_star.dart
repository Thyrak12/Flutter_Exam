// Widget to disaply a restaurant stars chip
// Widget to disaply a restaurant type chip
import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  final double star;
  
  const RatingStar({super.key, required this.star});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Icon(Icons.star_border_outlined);
      },
    );
  }
}
