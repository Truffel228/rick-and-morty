import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/enum/gender_enum.dart';
import 'package:rick_and_morty/enum/status_enum.dart';
import 'package:rick_and_morty/models/character/character/character.dart';

import 'widgets/widgets.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  final Character character = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick And Morty'),
        centerTitle: true,
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(character.imageUrl)),
              ),
              const SizedBox(height: 20),
              AppCard(title: 'Name', child: Text(character.name)),
              AppCard(
                title: 'Gender',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(character.gender.title),
                    const SizedBox(width: 20),
                    character.gender.icon
                  ],
                ),
              ),
              AppCard(
                title: 'Status',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(character.status.title),
                    const SizedBox(width: 20),
                    character.status.icon
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Episodes',
                  style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              EpisodesListView(episodeNames: character.episodeNames),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
