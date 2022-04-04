import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_and_morty/repositories/character/character_repository.dart';
import 'package:rick_and_morty/screens/home/home_controller.dart';
import 'package:rick_and_morty/services/character/character_service_interface.dart';
import 'package:rick_and_morty/locator.dart';

import 'widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final HomeController _homeController = HomeController(
    characterRepository: CharacterRepository(
      characterService: locator.get<CharacterServiceInterface>(),
    ),
  );

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 10) {
        _homeController.loadMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick And Morty'),
        centerTitle: true,
      ),
      body: Center(
        child: GetBuilder<HomeController>(
          init: _homeController,
          builder: (controller) {
            if (controller.characterList.isEmpty && !controller.isError) {
              return CircularProgressIndicator(
                color: theme.primaryColor,
              );
            }
            if (controller.characterList.isNotEmpty && !controller.isError) {
              return SizedBox.expand(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  controller: _scrollController,
                  itemCount: controller.characterList.length + 1,
                  itemBuilder: (context, index) => index !=
                          controller.characterList.length
                      ? CharacterListItem(
                          character: controller.characterList[index],
                        )
                      : controller.isLoadingMore
                          ? Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: theme.primaryColor,
                                ),
                              ),
                            )
                          : controller.endOfList
                              ? Container(
                                  margin: EdgeInsets.all(10),
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                      color: theme.primaryColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  alignment: Alignment.center,
                                  child: Text('You viewed all the characters'),
                                )
                              : const SizedBox.shrink(),
                ),
              );
            }
            return Text(
                'controller first value ${controller.characterList[0]}');
          },
        ),
      ),
    );
  }
}
