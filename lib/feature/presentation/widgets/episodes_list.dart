import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/common/network_images.dart';
import 'package:rick_morty/feature/domain/entities/episode_entity.dart';

class EpisodeList extends StatelessWidget {
  final EpisodeEntity result;

  const EpisodeList({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 120,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          NetworkImages.episodeImage),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('СЕРИЯ ${result.id}',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: const Color(0xff22A2BD))),
                    const SizedBox(height: 10),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Text(
                          result.name,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.white),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(result.air_date,
                        style: Theme.of(context).textTheme.bodySmall!),
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
