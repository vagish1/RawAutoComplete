import 'dart:convert';

class UserModel {
  final String name;
  final String email;
  final String profilePhoto;
  UserModel({
    required this.name,
    required this.email,
    required this.profilePhoto,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? profilePhoto,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      profilePhoto: profilePhoto ?? this.profilePhoto,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'profilePhoto': profilePhoto,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      profilePhoto: map['profilePhoto'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() => ' $name, $email'.toLowerCase();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.name == name &&
        other.email == email &&
        other.profilePhoto == profilePhoto;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ profilePhoto.hashCode;
}
