import 'package:json_annotation/json_annotation.dart';

class CharacterApi {
  CharacterApi({
    required this.name,
    required this.status,
    required this.gender,
    required this.episode,
    required this.image,
  });
  final String name;
  final String status;
  final String gender;
  final List<String> episode;
  final String image;
  factory CharacterApi.fromJson(Map<String, dynamic> json) => CharacterApi(
        name: json['name'],
        status: json['status'],
        gender: json['gender'],
        episode: (json['episode'] as List<dynamic>).map((episode) => episode as String).toList(),
        image: json['image'],
      );
}
