import 'dart:convert';

class Token {
  final String token;
  Token({
    required this.token,
  });

  Token copyWith({
    String? token,
  }) {
    return Token(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return Token(
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Token.fromJson(String source) => Token.fromMap(json.decode(source));

  @override
  String toString() => 'Token(token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Token && other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
