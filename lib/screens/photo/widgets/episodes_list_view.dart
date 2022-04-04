import 'package:flutter/material.dart';

class EpisodesListView extends StatelessWidget {
  const EpisodesListView({Key? key, required this.episodeNames})
      : super(key: key);
  final List<String> episodeNames;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      shrinkWrap: true,
      itemCount: episodeNames.length,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: theme.primaryColor,
        ),
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        height: 30,
        child: Center(
          child: Text(
            episodeNames[index],
          ),
        ),
      ),
    );
  }
}
