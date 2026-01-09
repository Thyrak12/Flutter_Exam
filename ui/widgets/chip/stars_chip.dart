// Widget to disaply a restaurant stars chip
// Widget to disaply a restaurant type chip
import 'package:flutter/material.dart';

class StarsChip extends StatelessWidget {
  final double star;
  const StarsChip({super.key, required this.star});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(Icons.star, color: Colors.orange),
      label: Text('$star'),
    );
  }
}
