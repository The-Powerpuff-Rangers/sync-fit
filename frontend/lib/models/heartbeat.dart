import 'dart:convert';

class HeartBeat {
  final int max;
  final int min;
  HeartBeat({
    required this.max,
    required this.min,
  });

  HeartBeat copyWith({
    int? max,
    int? min,
  }) {
    return HeartBeat(
      max: max ?? this.max,
      min: min ?? this.min,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'max': max,
      'min': min,
    };
  }

  factory HeartBeat.fromMap(Map<String, dynamic> map) {
    return HeartBeat(
      max: map['Out of Range']['max']?.toInt() ?? 0,
      min: map['Out of Range']['min']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory HeartBeat.fromJson(String source) => HeartBeat.fromMap(json.decode(source));

  @override
  String toString() => 'HeartBeat(max: $max, min: $min)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HeartBeat && other.max == max && other.min == min;
  }

  @override
  int get hashCode => max.hashCode ^ min.hashCode;
}
