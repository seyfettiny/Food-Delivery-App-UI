import 'dart:convert';

class User {
  String name;
  String imgUrl;
  User({
    this.name,
    this.imgUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imgUrl': imgUrl,
    };
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(Map<String, dynamic> map) => User(
        imgUrl: map['imgUrl'],
        name: map['name'],
      );
}
