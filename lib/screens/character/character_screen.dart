import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/blocs/character/character_bloc.dart';
import 'package:rick_morty/data/models/character.dart';
import 'package:rick_morty/widgets/character_list.dart';
import 'package:rick_morty/widgets/search_bar.dart';

class CharacterScreen extends StatelessWidget {
  final List<Character> _results = [];

  final ScrollController _scrollController = ScrollController();
  static const String routeName = '/';

  CharacterScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => CharacterScreen(),
    );
  }

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
            if (state is CharacterError && _results.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CharacterBloc>().add(CharacterEventFetch());
                    },
                    icon: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              );
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
