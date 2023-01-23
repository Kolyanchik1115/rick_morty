import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/feature/domain/entities/location_enitity.dart';
import 'package:rick_morty/feature/presentation/blocs/location/location_bloc.dart';
import 'package:rick_morty/feature/presentation/widgets/location_list.dart';
import 'package:rick_morty/feature/presentation/widgets/search/location_search.dart';
import 'package:rick_morty/feature/presentation/widgets/search_bar.dart';

class LocationScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        hintText: 'Найти локацию',
        delegate: LocationSearch(),
      ),
      body: Center(
        child: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            List<LocationEntity> results = [];
            bool isLoading = false;

            if (state is LocationLoading && state.isFirstFetch) {
              return const CircularProgressIndicator();
            }
            if (state is LocationLoading) {
              results = state.oldLocation;
              isLoading = true;
            }
            if (state is LocationLoaded) {
              results = state.locationLoaded;
            }
            return ListView.builder(
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.offset ==
                      _scrollController.position.maxScrollExtent) {
                    context.read<LocationBloc>().add(LocationEventFetch());
                  }
                }),
              itemCount: results.length + (isLoading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < results.length) {
                  return LocationList(result: results[index]);
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
