import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String password;

  const User({required this.email, required this.password});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(email: map['email'], password: map['password']);
  }

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password};
  }

  @override
  List<Object?> get props => [email, password];
}
