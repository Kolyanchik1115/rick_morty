import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/presentation/screens/character/character_detail_screen.dart';
import 'package:rick_morty/feature/presentation/widgets/character_status.dart';

class CharacterList extends StatelessWidget {
  final CharacterEntity result;
  const CharacterList({Key? key, required this.result}) : super(key: key);

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 120,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                foregroundImage: CachedNetworkImageProvider(
                  result.image,
                ),
                radius: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CharacterStatus(
                        liveState: result.status == 'Alive'
                            ? LiveState.alive
                            : result.status == 'Dead'
                                ? LiveState.dead
                                : LiveState.unknown),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Text(
                          result.name.toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: Colors.white),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(result.species,
                            style: Theme.of(context).textTheme.bodySmall!),
                        Text(', ',
                            style: Theme.of(context).textTheme.bodySmall),
                        Text(result.gender,
                            style: Theme.of(context).textTheme.bodySmall!),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
