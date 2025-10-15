import 'package:flutter/material.dart';

class FoodLog extends StatelessWidget {
  const FoodLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Log"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              """Displays:
                Today’s total calories and macros
                List of meals (Breakfast, Lunch, Dinner, Snacks)
                Individual food items in each meal

                Features:
                Add, edit, and delete meals and foods
                Search or filter food entries
                Timestamped meals
                Optional: Barcode scanner for packaged foods
                """,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
