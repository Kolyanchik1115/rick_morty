import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/common/theme.dart';
import 'package:rick_morty/feature/domain/entities/character_enitity.dart';
import 'package:rick_morty/feature/presentation/blocs/character_bloc/search_character/search_character_bloc.dart';
import 'package:rick_morty/feature/presentation/widgets/character_list.dart';
class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate() : super(searchFieldLabel: 'Search for characters...');

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
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<SearchCharacterBloc>().add(SearchCharacters(query));
    return BlocBuilder<SearchCharacterBloc, SearchCharacterState>(
      builder: (context, state) {
        if (state is PersonSearchLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PersonSearchLoaded) {
          final res = state.persons;
          if (res.isEmpty) {
            return const Text(
              'No Characters with that name found',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            );
          }
          return ListView.builder(
            itemCount: res.isNotEmpty ? res.length : 0,
            itemBuilder: (context, int index) {
              CharacterEntity result = res[index];
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
