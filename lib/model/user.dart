import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? id;
  final String nama;
  final int age;
  final DateTime birthday;

  User({
    this.id = '',
    required this.nama,
    required this.age,
    required this.birthday,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
    'age': age,
    'birthday': birthday,
  };

  static User fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    nama: json['nama'],
    age: json['age'],
    birthday: (json['birthday'] as Timestamp).toDate(),
  );

}