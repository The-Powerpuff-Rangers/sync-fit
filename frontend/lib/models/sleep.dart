import 'dart:convert';

import 'package:flutter/foundation.dart';

class Sleep {
  final List sleep;
  final int totalMinutesAsleep;
  final int totalSleepRecords;
  final int totalMinutesAwake;
  Sleep({
    required this.sleep,
    required this.totalMinutesAsleep,
    required this.totalSleepRecords,
    required this.totalMinutesAwake,
  });

  Sleep copyWith({
    List? sleep,
    int? totalMinutesAsleep,
    int? totalSleepRecords,
    int? totalMinutesAwake,
  }) {
    return Sleep(
      sleep: sleep ?? this.sleep,
      totalMinutesAsleep: totalMinutesAsleep ?? this.totalMinutesAsleep,
      totalSleepRecords: totalSleepRecords ?? this.totalSleepRecords,
      totalMinutesAwake: totalMinutesAwake ?? this.totalMinutesAwake,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sleep': sleep,
      'totalMinutesAsleep': totalMinutesAsleep,
      'totalSleepRecords': totalSleepRecords,
      'totalMinutesAwake': totalMinutesAwake,
    };
  }

  factory Sleep.fromMap(Map<String, dynamic> map) {
    return Sleep(
      sleep: List.from(map['sleep']),
      totalMinutesAsleep: map['summary']['totalMinutesAsleep']?.toInt() ?? 0,
      totalSleepRecords: map['summary']['totalSleepRecords']?.toInt() ?? 0,
      totalMinutesAwake: map['summary']['totalMinutesAwake']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sleep.fromJson(String source) => Sleep.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Sleep(sleep: $sleep, totalMinutesAsleep: $totalMinutesAsleep, totalSleepRecords: $totalSleepRecords, totalMinutesAwake: $totalMinutesAwake)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Sleep &&
        listEquals(other.sleep, sleep) &&
        other.totalMinutesAsleep == totalMinutesAsleep &&
        other.totalSleepRecords == totalSleepRecords &&
        other.totalMinutesAwake == totalMinutesAwake;
  }

  @override
  int get hashCode {
    return sleep.hashCode ^
        totalMinutesAsleep.hashCode ^
        totalSleepRecords.hashCode ^
        totalMinutesAwake.hashCode;
  }
}
