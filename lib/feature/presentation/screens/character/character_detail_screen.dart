import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/presentation/widgets/character_status.dart';

class CharacterDetailScreen extends StatelessWidget {
  final CharacterEntity character;

  const CharacterDetailScreen({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            BlurImage(character: character),
            const SizedBox(
              height: 40,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CharacterStatus(
                    liveState: character.status == 'Alive'
                        ? LiveState.alive
                        : character.status == 'Dead'
                            ? LiveState.dead
                            : LiveState.unknown)
              ],
            ),
            const SizedBox(
              height: 70,
            ),
            BuildText(
              character: character,
            ),
          ],
        ),
      ),
    );
  }
}

class BlurImage extends StatelessWidget {
  const BlurImage({
    super.key,
    required this.character,
  });

  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: Container(
            height: MediaQuery.of(context).size.height * .32,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(character.image),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .16,
              right: 20.0,
              left: 20.0),
          child: const SizedBox(
            child: CircleAvatar(
              backgroundColor: Color(0xff0B1E2D),
              radius: 110,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .17,
              right: 20.0,
              left: 20.0),
          child: SizedBox(
            child: CircleAvatar(
              foregroundImage: CachedNetworkImageProvider(character.image),
              radius: 100,
            ),
          ),
        ),
      ],
    );
  }
}

class BuildText extends StatelessWidget {
  final CharacterEntity character;

  const BuildText({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            customText('Пол:', character.gender),
            const SizedBox(
              width: 200,
            ),
            customText('Расса:', character.species),
          ],
        ),
        const SizedBox(height: 80),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText('Место рождения:', character.origin.name),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 14,
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            customText('Местоположение:', character.location.name),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 14,
            ),
          ],
        ),
      ],
    );
  }
}

Widget customText(String text, String value) {
  return Column(
    children: [
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
    ],
  );
}
