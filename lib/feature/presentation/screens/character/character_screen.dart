import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/presentation/blocs/character/character_bloc.dart';
import 'package:rick_morty/feature/presentation/widgets/lists/character_grid.dart';
import 'package:rick_morty/feature/presentation/widgets/lists/character_list.dart';
import 'package:rick_morty/feature/presentation/widgets/search/character_search.dart';
import 'package:rick_morty/feature/presentation/widgets/search/search_bar.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  final ScrollController _scrollController = ScrollController();
  var status = 0;

  void setupScroll(BuildContext context) {
    _scrollController.addListener(
      () {
        if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent) {
          context.read<CharacterBloc>().add(CharacterEventFetch());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    setupScroll(context);
    return Scaffold(
      appBar: SearchBar(
        hintText: 'Найти персонажа',
        delegate: CharacterSearch(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ВСЕГО ПЕРСОНАЖЕЙ: ${826}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () {
                      setState(
                        () {
                          if (status == 0) {
                            status = 1;
                          } else {
                            status = 0;
                          }
                        },
                      );
                    },
                    child: const Icon(
                      BoxIcons.bx_grid_alt,
                      color: Color(0xff5B6975),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CharacterListWidget(
              status: status,
              scrollController: _scrollController,
            ),
          ),
        ],
      ),
    );
  }
}

class CharacterListWidget extends StatelessWidget {
  const CharacterListWidget({
    super.key,
    required this.status,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final int status;
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          List<CharacterEntity> results = [];
          bool isLoading = false;

          if (state.status == CharacterStatus.loading && state.isFirstFetch) {
            return const CircularProgressIndicator();
          }
          if (state.status == CharacterStatus.loading) {
            results = state.oldCharacter;
            isLoading = true;
          }
          if (state.status == CharacterStatus.loaded) {
            results = state.characterLoaded;
          }

          return status == 0
              ? ListView.builder(
                  controller: _scrollController,
                  itemCount: results.length + (isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < results.length) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: CharacterList(result: results[index]),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                  ),
                  controller: _scrollController,
                  itemCount: results.length + (isLoading ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index < results.length) {
                      return CharacterGrid(result: results[index]);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                );
        },
      ),
    );
  }
}
