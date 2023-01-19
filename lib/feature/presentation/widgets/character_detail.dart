import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/presentation/widgets/character_status.dart';

class CharacterDetailPage extends StatelessWidget {
  final CharacterEntity character;

  const CharacterDetailPage({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text('Character'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
              character.name,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            CachedNetworkImage(
              width: 260,
              height: 260,
              imageUrl: character.image,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CharacterStatus(
                    liveState: character.status == 'Alive'
                        ? LiveState.alive
                        : character.status == 'Dead'
                            ? LiveState.dead
                            : LiveState.unknown),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            if (character.type.isNotEmpty)
              ...buildText('Type:', character.type),
            ...buildText('Gender:', character.gender),
            ...buildText(
                'Number of episodes: ', character.episode.length.toString()),
            ...buildText('Species:', character.species),
            ...buildText('Was created:', character.created.toString()),
          ],
        ),
      ),
    );
  }

  List<Widget> buildText(String text, String value) {
    return [
      Text(
        text,
        style: const TextStyle(
          color: Colors.grey,
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(
        value,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      const SizedBox(
        height: 12,
      ),
    ];
  }
}
