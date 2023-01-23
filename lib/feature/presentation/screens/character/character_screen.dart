import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/presentation/blocs/character/character_bloc.dart';
import 'package:rick_morty/feature/presentation/widgets/character_list.dart';
import 'package:rick_morty/feature/presentation/widgets/search/character_search.dart';
import 'package:rick_morty/feature/presentation/widgets/search_bar.dart';

class CharacterScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        hintText: 'Найти персонажа',
        delegate: CharacterSearch(),
      ),
      body: Center(
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            List<CharacterEntity> results = [];
            bool isLoading = false;

            if (state is CharacterLoading && state.isFirstFetch) {
              return const CircularProgressIndicator();
            }
            if (state is CharacterLoading) {
              results = state.oldCharacter;
              isLoading = true;
            }
            if (state is CharacterLoaded) {
              results = state.characterLoaded;
            }
            return ListView.builder(
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.offset ==
                      _scrollController.position.maxScrollExtent) {
                    context.read<CharacterBloc>().add(CharacterEventFetch());
                  }
                }),
              itemCount: results.length + (isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < results.length) {
                  return CharacterList(result: results[index]);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          },
        ),
      ),
    );
  }
}
