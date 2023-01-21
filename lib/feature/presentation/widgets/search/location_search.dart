import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/common/theme.dart';
import 'package:rick_morty/feature/domain/entities/location_enitity.dart';
import 'package:rick_morty/feature/presentation/blocs/location/search_location/bloc/search_location_bloc.dart';

import 'package:rick_morty/feature/presentation/widgets/location_container.dart';

class LocationSearch extends SearchDelegate {
  LocationSearch() : super(searchFieldLabel: 'Search for locations...');

  final _suggestions = [
    'Earth',
    'Abadango',
    'Nuptia',
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
    context.read<SearchLocationBloc>().add(SearchLocations(query));
    return BlocBuilder<SearchLocationBloc, SearchLocationState>(
      builder: (context, state) {
        if (state is SearchLocationLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SearchLocationLoaded) {
          final res = state.locations;
          return ListView.builder(
            itemCount: res.isNotEmpty ? res.length : 0,
            itemBuilder: (context, int index) {
              LocationEntity result = res[index];
              return LocationContainer(result: result);
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
