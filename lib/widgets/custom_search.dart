import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/blocs/search_character/search_character_bloc.dart';
import 'package:rick_morty/config/theme.dart';
import 'package:rick_morty/data/models/character.dart';
import 'package:rick_morty/widgets/character_list.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate() : super(searchFieldLabel: 'Search for characters...');

  final List<Character> _results = [];

  final ScrollController _scrollController = ScrollController();

  final _suggestions = [
    'Rick',
    'Morty',
    'Jerry',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back_outlined),
        tooltip: 'Back',
        onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<SearchCharacterBloc>().add(SearchPersons(query));
    return BlocBuilder<SearchCharacterBloc, SearchCharacterState>(
      builder: (context, state) {
        if (state is PersonSearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PersonSearchLoaded) {
          _results.addAll(state.persons);

          if (_results.isEmpty) {
            return const Text(
              'No Characters with that name found',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            );
          }
          return ListView.builder(
            controller: _scrollController
              ..addListener(() {
                if (_scrollController.offset ==
                    _scrollController.position.maxScrollExtent) {
                  context.read<SearchCharacterBloc>().add(SearchPersons(query));
                }
              }),
            itemCount: _results.isNotEmpty ? _results.length : 0,
            itemBuilder: (context, int index) {
              Character result = _results[index];
              return CharacterList(result: result);
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      return Container();
    }

    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return Text(
          _suggestions[index],
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: _suggestions.length,
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return searchTheme();
  }
}
