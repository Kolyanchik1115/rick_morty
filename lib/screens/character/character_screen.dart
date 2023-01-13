import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rick_morty/blocs/character/character_bloc.dart';
import 'package:rick_morty/data/models/character.dart';
import 'package:rick_morty/widgets/character_list.dart';
import 'package:rick_morty/widgets/search_bar.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  static const String routeName = '/character';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CharacterScreen(),
    );
  }

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late Character _currentCharacter;

  List<Results> _currentResults = [];

  int _currentPage = 1;

  bool _isPagination = false;

  final RefreshController refreshController = RefreshController();

  @override
  void initState() {
    if (_currentResults.isEmpty) {
      context.read<CharacterBloc>().add(const CharacterEventFetch(page: 1));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchBar(
        hintText: 'Найти персонажа',
      ),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            if (!_isPagination) {
              return Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(strokeWidth: 2),
                    SizedBox(width: 10),
                    Text('Loading...'),
                  ],
                ),
              );
            } else {
              return _customListView(_currentResults);
            }
          }
          if (state is CharacterLoaded) {
            _currentCharacter = state.characterLoaded;
            if (_isPagination) {
              List.from(_currentResults).addAll(_currentCharacter.results);
              refreshController.loadComplete();
              _isPagination = false;
            } else {
              _currentResults = _currentCharacter.results;
            }
            return _currentResults.isNotEmpty
                ? _customListView(_currentResults)
                : const SizedBox();
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
      //Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Text(
      //         'ВСЕГО ПЕРСОНАЖЕЙ:  200',
      //         style: Theme.of(context).textTheme.displayLarge,
      //       ),
      //       IconButton(
      //         // BoxIcons.bx_list_ul,
      //         icon: const Icon(
      //           BoxIcons.bx_grid_alt,
      //           color: Color(0xff5B6975),
      //         ),
      //         onPressed: () {},
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _customListView(List<Results> currentResults) {
    return SmartRefresher(
      controller: refreshController,
      enablePullUp: true,
      enablePullDown: false,
      onLoading: () {
        _isPagination = true;
        _currentPage++;
        if (_currentPage <= _currentCharacter.info.pages) {
          context.read<CharacterBloc>().add(CharacterEventFetch(
              page: _currentPage));
        } else {
          refreshController.loadNoData();
        }
      },
      child: ListView.separated(
        itemCount: currentResults.length,
        separatorBuilder: (_, index) => const SizedBox(height: 5),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final result = currentResults[index];
          return Padding(
            padding:
                const EdgeInsets.only(right: 16, left: 16, top: 3, bottom: 3),
            child: CharacterList(result: result),
          );
        },
      ),
    );
  }
}
