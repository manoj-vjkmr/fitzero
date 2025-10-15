class DailyStats {
  final int calorieGoal;
  final int caloriesConsumed;
  final int protein;
  final int carbs;
  final int fats;

  DailyStats({
    required this.calorieGoal,
    required this.caloriesConsumed,
    required this.protein,
    required this.carbs,
    required this.fats,
  });

  double get calorieProgress =>
      caloriesConsumed / calorieGoal.clamp(1, double.infinity);
}
