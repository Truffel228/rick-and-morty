import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:rick_and_morty/enum/gender_enum.dart';
import 'package:rick_and_morty/models/character/character/character.dart';

class CharacterListItem extends StatelessWidget {
  const CharacterListItem(
      {Key? key,
      required this.character})
      : super(key: key);
  final Character character;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: ()=>Get.toNamed('/photoScreen', arguments: character),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: theme.primaryColor, borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.only(right: 10, left: 10, top: 10),
        width: double.infinity,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              character.imageUrl,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(character.name),
              const SizedBox(height: 5),
              character.gender.icon,
            ],
          ),
        ),
      ),
    );
  }
}
