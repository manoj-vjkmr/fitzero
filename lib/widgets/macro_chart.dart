import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MacroChart extends StatelessWidget {
  final int protein;
  final int carbs;
  final int fats;

  const MacroChart({
    super.key,
    required this.protein,
    required this.carbs,
    required this.fats,
  });

  @override
  Widget build(BuildContext context) {
    final total = protein + carbs + fats;

    return PieChart(
      PieChartData(
        sectionsSpace: 2,
        centerSpaceRadius: 50,
        sections: [
          PieChartSectionData(
            color: Colors.redAccent,
            value: protein.toDouble(),
            title: '${(protein / total * 100).toStringAsFixed(0)}%',
            radius: 60,
          ),
          PieChartSectionData(
            color: Colors.blueAccent,
            value: carbs.toDouble(),
            title: '${(carbs / total * 100).toStringAsFixed(0)}%',
            radius: 60,
          ),
          PieChartSectionData(
            color: Colors.orangeAccent,
            value: fats.toDouble(),
            title: '${(fats / total * 100).toStringAsFixed(0)}%',
            radius: 60,
          ),
        ],
      ),
    );
  }
}
