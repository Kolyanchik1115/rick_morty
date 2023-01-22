import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/feature/domain/entities/location_enitity.dart';
import 'package:rick_morty/feature/presentation/blocs/location/location_bloc.dart';
import 'package:rick_morty/feature/presentation/widgets/location_container.dart';
import 'package:rick_morty/feature/presentation/widgets/search/location_search.dart';
import 'package:rick_morty/feature/presentation/widgets/search_bar.dart';

class LocationScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<LocationEntity> results = [];

    return Scaffold(
      appBar: SearchBar(
        hintText: 'Найти локацию',
        delegate: LocationSearch(),
      ),
      body: Center(
        child: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            if (state is LocationLoading) {
              return const CircularProgressIndicator();
            }
            if (state is LocationLoaded) {
              results.addAll(state.locationLoaded);
            }

            return ListView.builder(
              controller: _scrollController
                ..addListener(() {
                  if (_scrollController.offset ==
                      _scrollController.position.maxScrollExtent) {
                    context.read<LocationBloc>().add(LocationEventFetch());
                  }
                }),
              itemBuilder: (context, index) =>
                  LocationContainer(result: results[index]),
              itemCount: results.length,
            );
          },
        ),
      ),
    );
  }
}
