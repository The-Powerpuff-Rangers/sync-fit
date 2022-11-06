import 'dart:convert';

class Activity {
  final String message;
  final int stepGoal;
  final int step;
  final double distance;
  final int calories;
  Activity({
    required this.message,
    required this.stepGoal,
    required this.step,
    required this.distance,
    required this.calories,
  });

  Activity copyWith({
    String? message,
    int? stepGoal,
    int? step,
    double? distance,
    int? calories,
  }) {
    return Activity(
      message: message ?? this.message,
      stepGoal: stepGoal ?? this.stepGoal,
      step: step ?? this.step,
      distance: distance ?? this.distance,
      calories: calories ?? this.calories,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'stepGoal': stepGoal,
      'step': step,
      'distance': distance,
      'calories': calories,
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      message: map['message'] ?? '',
      stepGoal: map['stepGoal']?.toInt() ?? 0,
      step: map['step']?.toInt() ?? 0,
      distance: map['distance']?.toDouble() ?? 0.0,
      calories: map['calories']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Activity.fromJson(String source) => Activity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Activity(message: $message, stepGoal: $stepGoal, step: $step, distance: $distance, calories: $calories)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Activity &&
        other.message == message &&
        other.stepGoal == stepGoal &&
        other.step == step &&
        other.distance == distance &&
        other.calories == calories;
  }

  @override
  int get hashCode {
    return message.hashCode ^
        stepGoal.hashCode ^
        step.hashCode ^
        distance.hashCode ^
        calories.hashCode;
  }
}
