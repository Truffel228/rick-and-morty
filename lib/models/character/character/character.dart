import 'package:rick_and_morty/enum/gender_enum.dart';
import 'package:rick_and_morty/enum/status_enum.dart';

class Character {
  Character({
    required this.imageUrl,
    required this.name,
    required this.gender,
    required this.status,
    required this.episodeNames,
  });
  final String imageUrl;
  final String name;
  final Gender gender;
  final Status status;
  final List<String> episodeNames;
}
