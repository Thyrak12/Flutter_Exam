// Widget to disaply a restaurant type chip
import 'package:flutter/material.dart';
import 'package:w4_app/final/models/restaurant_type.dart';

class RestaurantTypeChip extends StatelessWidget {
  final RestaurantType type;
  const RestaurantTypeChip({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: type.color,
      label: Text(
        type.name.toUpperCase(),
      ),
    );
  }
}