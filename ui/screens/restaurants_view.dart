import 'package:flutter/material.dart';
import 'package:w4_app/final/models/restaurant_type.dart';
import 'package:w4_app/final/ui/screens/restaurant_comments_view.dart';
import 'package:w4_app/final/ui/widgets/chip/restaurant_type_chip.dart';
import 'package:w4_app/final/ui/widgets/chip/stars_chip.dart';

import '../../models/restaurant.dart';
import '../theme.dart';

class RestaurantsView extends StatefulWidget {
  const RestaurantsView({
    super.key,
    required this.restaurants,
  });

  final List<Restaurant> restaurants;

  @override
  State<RestaurantsView> createState() => _RestaurantsViewState();
}

class _RestaurantsViewState extends State<RestaurantsView> {
  bool isCheck = false;

  void onChanged(bool? value) {
    setState(() {
      isCheck = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Restaurant> filteredRestaurants = isCheck
        ? widget.restaurants
            .where((res) => res.type == RestaurantType.khmer)
            .toList()
        : widget.restaurants;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main,
        title: const Text('Miam'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Row(
            children: [
              Checkbox(
                value: isCheck,
                onChanged: onChanged,
              ),
              const SizedBox(width: 8),
              const Text(
                'Show all Khmer Restaurants',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...filteredRestaurants.map(
            (res) => RestaurantItem(
              restaurant: res,
            ),
          ),
        ],
      ),
    );
  }
}

class RestaurantItem extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantItem({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                RestaurantCommentsView(restaurant: restaurant),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                StarsChip(star: restaurant.getAverage()),
                const SizedBox(width: 20),
                RestaurantTypeChip(type: restaurant.type),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
