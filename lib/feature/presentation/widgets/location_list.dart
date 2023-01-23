import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/feature/domain/entities/location_enitity.dart';

class LocationList extends StatelessWidget {
  final LocationEntity result;
  const LocationList({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .20,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    30,
                  ),
                  topLeft: Radius.circular(
                    30,
                  ),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                      'https://i.ytimg.com/vi/BSymgfwoAmI/maxresdefault.jpg'),
                ),
              ),
            ),
            Container(
              height: 80,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    30,
                  ),
                  bottomRight: Radius.circular(
                    30,
                  ),
                ),
                color: Color(0xff152A3A),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        result.name,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.white),
                      ),
                      Row(
                        children: [
                          Text(
                            result.type,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(width: 3),
                          const Icon(
                            Icons.circle,
                            size: 2,
                            color: Color(0xff5B6975),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            result.dimension,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
