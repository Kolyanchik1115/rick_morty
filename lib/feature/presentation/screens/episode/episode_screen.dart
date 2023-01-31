import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/feature/domain/entities/episode_entity.dart';
import 'package:rick_morty/feature/presentation/blocs/episode/episode_bloc.dart';
import 'package:rick_morty/feature/presentation/widgets/lists/episodes_list.dart';
import 'package:rick_morty/feature/presentation/widgets/search/episode_search.dart';
import 'package:rick_morty/feature/presentation/widgets/search/search_bar.dart';

class EpisodeScreen extends StatefulWidget {
  const EpisodeScreen({super.key});

  @override
  State<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        hintText: 'Найти эпизод',
        delegate: EpisodeSearch(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Text(
                  'ВСЕГО ЭПИЗОДОВ: ${51}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: BlocBuilder<EpisodeBloc, EpisodeState>(
                builder: (context, state) {
                  List<EpisodeEntity> results = [];
                  bool isLoading = false;

                  if (state is EpisodeLoading && state.isFirstFetch) {
                    return const CircularProgressIndicator();
                  }
                  if (state is EpisodeLoading) {
                    results = state.oldEpisode;
                    isLoading = true;
                  }
                  if (state is EpisodeLoaded) {
                    results = state.episodeLoaded;
                  }

                  return ListView.builder(
                    controller: _scrollController
                      ..addListener(() {
                        if (_scrollController.offset ==
                            _scrollController.position.maxScrollExtent) {
                          context.read<EpisodeBloc>().add(EpisodeEventFetch());
                        }
                      }),
                    itemCount: results.length + (isLoading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index < results.length) {
                        return EpisodeList(result: results[index]);
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
