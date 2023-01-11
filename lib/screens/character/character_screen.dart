import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/blocs/character/character_bloc.dart';
import 'package:rick_morty/widgets/character_list.dart';
import 'package:rick_morty/widgets/search_bar.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  static const String routeName = '/character';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const CharacterScreen(),
    );
  }
  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchBar(
        hintText: 'Найти персонажа',
      ),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return const CircularProgressIndicator();
          }
          if (state is CharacterLoaded) {
            var character = state.characterLoaded.results.toList();
            return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 2,
              //   childAspectRatio: 1.15,
              // ),
              itemCount: character.length,
              itemBuilder: (BuildContext context, int index) {
                return Center(
                  child: CharacterList(
                    result: character[index],
                  ),
                );
              },
            );
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
}
