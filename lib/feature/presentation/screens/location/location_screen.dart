import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/feature/domain/entities/location_enitity.dart';
import 'package:rick_morty/feature/presentation/blocs/location/location_bloc.dart';
import 'package:rick_morty/feature/presentation/widgets/location_list.dart';
import 'package:rick_morty/feature/presentation/widgets/search/location_search.dart';
import 'package:rick_morty/feature/presentation/widgets/search_bar.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar(
        hintText: 'Найти локацию',
        delegate: LocationSearch(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Text(
                  'ВСЕГО ЛОКАЦИЙ: ${126}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
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
                          context
                              .read<LocationBloc>()
                              .add(LocationEventFetch());
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
