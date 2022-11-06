import 'dart:convert';

class RegistrationResponse {
  final String status;
  final String message;
  final String token;
  final String userId;
  RegistrationResponse({
    required this.status,
    required this.message,
    required this.token,
    required this.userId,
  });

  RegistrationResponse copyWith({
    String? status,
    String? message,
    String? token,
    String? userId,
  }) {
    return RegistrationResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      token: token ?? this.token,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'message': message,
      'token': token,
      'userId': userId,
    };
  }

  factory RegistrationResponse.fromMap(Map<String, dynamic> map) {
    return RegistrationResponse(
      status: map['status'] ?? '',
      message: map['message'] ?? '',
      token: map['token'] ?? '',
      userId: map['user_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationResponse.fromJson(String source) =>
      RegistrationResponse.fromMap(json.decode(source));

  @override
  String toString() => 'RegistrationResponse(status: $status, message: $message, token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegistrationResponse &&
        other.status == status &&
        other.message == message &&
        other.token == token;
  }

  @override
  int get hashCode => status.hashCode ^ message.hashCode ^ token.hashCode;
}
