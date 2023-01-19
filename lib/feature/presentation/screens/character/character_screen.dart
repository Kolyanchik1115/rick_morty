import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/presentation/blocs/character_bloc/character/character_bloc.dart';
import 'package:rick_morty/feature/presentation/widgets/character_list.dart';
import 'package:rick_morty/feature/presentation/widgets/search_bar.dart';

class CharacterScreen extends StatelessWidget {
  final List<CharacterEntity> _results = [];

  final ScrollController _scrollController = ScrollController();

  CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchBar(
        hintText: 'Найти персонажа',
      ),
      body: Center(
        child: BlocBuilder<CharacterBloc, CharacterState>(
          builder: (context, state) {
            if (state is CharacterLoading) {
              return const CircularProgressIndicator();
            }
            if (state is CharacterLoaded) {
              _results.addAll(state.characterLoaded);
            }
            
            return ListView.builder(
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.offset ==
                      _scrollController.position.maxScrollExtent) {
                    context.read<CharacterBloc>().add(CharacterEventFetch());
                  }
                }),
              itemBuilder: (context, index) =>
                  CharacterList(result: _results[index]),
              itemCount: _results.length,
            );
          },
        ),
      ),
    );
  }
}
