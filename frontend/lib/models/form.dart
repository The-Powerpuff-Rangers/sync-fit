import 'dart:convert';

class FormModel {
  final String userEmail;
  final String mobileNumber;
  final String doctorEmailAdress;
  final String doctorName;
  final String authCode;
  FormModel({
    required this.userEmail,
    required this.mobileNumber,
    required this.doctorEmailAdress,
    required this.doctorName,
    required this.authCode,
  });

  FormModel copyWith({
    String? userEmail,
    String? mobileNumber,
    String? doctorEmailAdress,
    String? doctorName,
    String? authCode,
  }) {
    return FormModel(
      userEmail: userEmail ?? this.userEmail,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      doctorEmailAdress: doctorEmailAdress ?? this.doctorEmailAdress,
      doctorName: doctorName ?? this.doctorName,
      authCode: authCode ?? this.authCode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': userEmail,
      'mobileNo': mobileNumber,
      'docEmail': doctorEmailAdress,
      // 'doctorName': doctorName,
      'authCode': authCode,
    };
  }

  factory FormModel.fromMap(Map<String, dynamic> map) {
    return FormModel(
      userEmail: map['email'] ?? '',
      mobileNumber: map['mobileno'] ?? '',
      doctorEmailAdress: map['docEmail'] ?? '',
      doctorName: map['doctorName'] ?? '',
      authCode: map['authCode'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FormModel.fromJson(String source) => FormModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FormModel(userEmail: $userEmail, mobileNumber: $mobileNumber, doctorEmailAdress: $doctorEmailAdress, doctorName: $doctorName, authCode: $authCode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FormModel &&
        other.userEmail == userEmail &&
        other.mobileNumber == mobileNumber &&
        other.doctorEmailAdress == doctorEmailAdress &&
        other.doctorName == doctorName &&
        other.authCode == authCode;
  }

  @override
  int get hashCode {
    return userEmail.hashCode ^
        mobileNumber.hashCode ^
        doctorEmailAdress.hashCode ^
        doctorName.hashCode ^
        authCode.hashCode;
  }
}
