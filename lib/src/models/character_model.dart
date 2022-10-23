import 'dart:convert';

import 'package:flutter/foundation.dart';

class CharacterModel {
  final int id;
  final String name;
  final String birthday;
  final List<String> occupation;
  final String img;
  final String status;
  final String nickname;
  final String portrayed;

  CharacterModel({
    required this.id,
    required this.name,
    required this.birthday,
    required this.occupation,
    required this.img,
    required this.status,
    required this.nickname,
    required this.portrayed,
  });

  CharacterModel copyWith({
    int? id,
    String? name,
    String? birthday,
    List<String>? occupation,
    String? img,
    String? status,
    String? nickname,
    String? portrayed,
  }) {
    return CharacterModel(
      id: id ?? this.id,
      name: name ?? this.name,
      birthday: birthday ?? this.birthday,
      occupation: occupation ?? this.occupation,
      img: img ?? this.img,
      status: status ?? this.status,
      nickname: nickname ?? this.nickname,
      portrayed: portrayed ?? this.portrayed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'char_id': id,
      'name': name,
      'birthday': birthday,
      'occupation': occupation,
      'img': img,
      'status': status,
      'nickname': nickname,
      'portrayed': portrayed,
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['char_id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      birthday: map['birthday'] ?? '',
      occupation: List<String>.from(map['occupation']),
      img: map['img'] ?? '',
      status: map['status'] ?? '',
      nickname: map['nickname'] ?? '',
      portrayed: map['portrayed'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CharacterModel(id: $id, name: $name, birthday: $birthday, occupation: $occupation, img: $img, status: $status, nickname: $nickname, portrayed: $portrayed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CharacterModel &&
        other.id == id &&
        other.name == name &&
        other.birthday == birthday &&
        listEquals(other.occupation, occupation) &&
        other.img == img &&
        other.status == status &&
        other.nickname == nickname &&
        other.portrayed == portrayed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        birthday.hashCode ^
        occupation.hashCode ^
        img.hashCode ^
        status.hashCode ^
        nickname.hashCode ^
        portrayed.hashCode;
  }
}
