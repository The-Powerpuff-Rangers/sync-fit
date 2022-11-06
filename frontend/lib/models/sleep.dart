import 'dart:convert';

import 'package:flutter/foundation.dart';

class Sleep {
  final List sleep;
  final int totalMinutesAsleep;
  final int totalSleepRecords;
  final int totalTimeInBed;
  Sleep({
    required this.sleep,
    required this.totalMinutesAsleep,
    required this.totalSleepRecords,
    required this.totalTimeInBed,
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
      totalTimeInBed: totalMinutesAwake ?? totalTimeInBed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sleep': sleep,
      'totalMinutesAsleep': totalMinutesAsleep,
      'totalSleepRecords': totalSleepRecords,
      'totalMinutesAwake': totalTimeInBed,
    };
  }

  factory Sleep.fromMap(Map<String, dynamic> map) {
    return Sleep(
      sleep: List.from(map['sleep']),
      totalMinutesAsleep: map['summary']['totalMinutesAsleep']?.toInt() ?? 0,
      totalSleepRecords: map['summary']['totalSleepRecords']?.toInt() ?? 0,
      totalTimeInBed: map['summary']['totalTimeInBed']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sleep.fromJson(String source) => Sleep.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Sleep(sleep: $sleep, totalMinutesAsleep: $totalMinutesAsleep, totalSleepRecords: $totalSleepRecords, totalMinutesAwake: $totalTimeInBed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Sleep &&
        listEquals(other.sleep, sleep) &&
        other.totalMinutesAsleep == totalMinutesAsleep &&
        other.totalSleepRecords == totalSleepRecords &&
        other.totalTimeInBed == totalTimeInBed;
  }

  @override
  int get hashCode {
    return sleep.hashCode ^
        totalMinutesAsleep.hashCode ^
        totalSleepRecords.hashCode ^
        totalTimeInBed.hashCode;
  }
}
