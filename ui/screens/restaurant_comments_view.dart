import 'package:flutter/material.dart';
import 'package:w4_app/final/models/restaurant.dart';
import 'package:w4_app/final/models/restaurant_comment.dart';
import 'package:w4_app/final/ui/screens/restaurant_comments_form.dart';
import 'package:w4_app/final/ui/widgets/chip/restaurant_type_chip.dart';
import 'package:w4_app/final/ui/widgets/chip/stars_chip.dart';

class RestaurantCommentsView extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantCommentsView({super.key, required this.restaurant});

  @override
  State<RestaurantCommentsView> createState() => _RestaurantCommentsViewState();
}

class _RestaurantCommentsViewState extends State<RestaurantCommentsView> {
  void showModal() async {
    final result = await showModalBottomSheet<RestaurantComment>(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: RestaurantCommentsForm(restaurant: widget.restaurant),
      ),
    );

    if (result != null) {
      setState(() {
        widget.restaurant.comment.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Details'),
        backgroundColor: Colors.lightBlue,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        onPressed: showModal,
        child: const Icon(Icons.add),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.lightBlue.shade100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.restaurant.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(widget.restaurant.address),
                const SizedBox(height: 10),
                Row(
                  children: [
                    StarsChip(star: widget.restaurant.getAverage()),
                    const SizedBox(width: 20),
                    RestaurantTypeChip(type: widget.restaurant.type),
                  ],
                ),
              ],
            ),
          ),
      
          const SizedBox(height: 20),
      
          Expanded(
            child: widget.restaurant.comment.isEmpty
                ? Center(
                    child: Text(
                      'No comments yet',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  )
                : ListView.builder(
                    itemCount: widget.restaurant.comment.length,
                    itemBuilder: (context, index) {
                      final cmt = widget.restaurant.comment[index];
                      return ListTile(
                        title: Text(cmt.cmt),
                        trailing: Text(' ${cmt.star}'),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
