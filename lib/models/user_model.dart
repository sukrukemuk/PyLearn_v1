// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String? uid;
  String password;
  String name;
  String surname;
  String username;
  String email;
  String? profilePhoto;
  UserModel({
    required this.uid,
    required this.password,
    required this.name,
    required this.surname,
    required this.username,
    required this.email,
    this.profilePhoto,
  });

  UserModel copyWith({
    String? uid,
    String? password,
    String? name,
    String? surname,
    String? username,
    String? email,
    String? profilePhoto,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      password: password ?? this.password,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      username: username ?? this.username,
      email: email ?? this.email,
      profilePhoto: profilePhoto ?? this.profilePhoto,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'password': password,
      'name': name,
      'surname': surname,
      'username': username,
      'email': email,
      'profilePhoto': profilePhoto,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      password: map['password'] as String,
      name: map['name'] as String,
      surname: map['surname'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      profilePhoto:
          map['profilePhoto'] != null ? map['profilePhoto'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, password: $password, name: $name, surname: $surname, username: $username, email: $email, profilePhoto: $profilePhoto)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.password == password &&
        other.name == name &&
        other.surname == surname &&
        other.username == username &&
        other.email == email &&
        other.profilePhoto == profilePhoto;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        password.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        username.hashCode ^
        email.hashCode ^
        profilePhoto.hashCode;
  }
}
