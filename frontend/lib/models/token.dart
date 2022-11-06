import 'dart:convert';

class Token {
  final String token;
  final String userId;
  Token({
    required this.token,
    required this.userId,
  });

  Token copyWith({
    String? token,
    String? userId,
  }) {
    return Token(
      token: token ?? this.token,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'userId': userId,
    };
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      token: map['token'] ?? '',
      userId: map['userId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) => Token.fromMap(json.decode(source));

  @override
  String toString() => 'Token(token: $token, userId: $userId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Token && other.token == token && other.userId == userId;
  }

  @override
  int get hashCode => token.hashCode ^ userId.hashCode;
}
