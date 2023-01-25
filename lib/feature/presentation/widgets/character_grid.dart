import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/presentation/screens/character/character_detail_screen.dart';
import 'package:rick_morty/feature/presentation/widgets/character_status.dart';

class CharacterGrid extends StatelessWidget {
  final CharacterEntity result;
  const CharacterGrid({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetailScreen(character: result),
          ),
        );
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            foregroundImage: CachedNetworkImageProvider(
              result.image,
            ),
            radius: 70,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CharacterStatus(
                liveState: result.status == 'Alive'
                    ? LiveState.alive
                    : result.status == 'Dead'
                        ? LiveState.dead
                        : LiveState.unknown,
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: Expanded(
              child: Center(
                child: Text(
                  result.name.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(result.species,
                  style: Theme.of(context).textTheme.bodySmall!),
              Text(', ', style: Theme.of(context).textTheme.bodySmall),
              Text(result.gender,
                  style: Theme.of(context).textTheme.bodySmall!),
            ],
          ),
        ],
      ),
    );
  }
}
