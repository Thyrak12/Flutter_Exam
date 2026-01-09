import 'package:flutter/material.dart';
import 'package:w4_app/final/models/restaurant.dart';
import 'package:w4_app/final/models/restaurant_comment.dart';
import 'package:w4_app/final/ui/widgets/chip/rating_star.dart';

class RestaurantCommentsForm extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantCommentsForm({
    super.key,
    required this.restaurant,
  });

  @override
  State<RestaurantCommentsForm> createState() => _RestaurantCommentsFormState();
}

class _RestaurantCommentsFormState extends State<RestaurantCommentsForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _commentController = TextEditingController();
  List<int> number = [5,4,3,2,1];
  int _rating = 5;

  void onCreate() {
    if (!_formKey.currentState!.validate()) return;

    final comment = RestaurantComment(
      cmt: _commentController.text,
      star: _rating,
    );

    Navigator.pop(context, comment);
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('How was your dinner?'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Comment
              const Text(
                'Comment',
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _commentController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Comment is required';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              /// Rating
              const Text(
                'Rating',
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<int>(
                initialValue: _rating,
                items: number.map((num) => DropdownMenuItem(value: num ,child: Text('$num'))).toList(),
                onChanged: (value) {
                  setState(() {
                    _rating = value ?? 5;
                  });
                },
              ),

              const SizedBox(height: 24),

              Expanded(child: RatingStar(star: widget.restaurant.getAverage())),

              /// Submit
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onCreate,
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
