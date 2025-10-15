import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/daily_stats.dart';
import '../widgets/macro_chart.dart';
import 'food_log.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Temporary hardcoded stats (later we’ll fetch from AWS)
    final stats = DailyStats(
      calorieGoal: 2000,
      caloriesConsumed: 1350,
      protein: 80,
      carbs: 150,
      fats: 50,
    );

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'Your Daily Summary',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🔸 Calorie Progress
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Calories Consumed",
                        style: GoogleFonts.poppins(fontSize: 18)),
                    const SizedBox(height: 10),
                    LinearProgressIndicator(
                      value: stats.calorieProgress,
                      backgroundColor: Colors.grey[300],
                      color: Colors.greenAccent[400],
                      minHeight: 10,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${stats.caloriesConsumed} / ${stats.calorieGoal} kcal",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 🔸 Macro Breakdown
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Macronutrient Breakdown",
                        style: GoogleFonts.poppins(fontSize: 18)),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 200,
                      child: MacroChart(
                        protein: stats.protein,
                        carbs: stats.carbs,
                        fats: stats.fats,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        _MacroLabel(color: Colors.redAccent, label: "Protein"),
                        _MacroLabel(color: Colors.blueAccent, label: "Carbs"),
                        _MacroLabel(color: Colors.orangeAccent, label: "Fats"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 🔸 Motivational Quote
            Text(
              "\"Small progress is still progress. Keep going!\"",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey[600],
              ),
            ),
                      
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FoodLog()),
                );
              },
              child: const Text("Go to Food Log"),
            ),
            
          ],
        ),
      ),
    );
  }
}

class _MacroLabel extends StatelessWidget {
  final Color color;
  final String label;
  const _MacroLabel({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 6, backgroundColor: color),
        const SizedBox(width: 6),
        Text(label),
      ],
    );
  }
}
