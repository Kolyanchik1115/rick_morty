import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rick_morty/widgets/custom_search.dart';

class SearchBar extends StatelessWidget with PreferredSizeWidget {
  final String hintText;

  const SearchBar({
    Key? key,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              showCursor: false,
              onTap: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              decoration: InputDecoration(
                
                filled: true,
                contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                fillColor:
                    Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.displayMedium,
                suffixIcon: Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Color(0xff5B6975), width: 0.6),
                    ),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      BoxIcons.bx_filter_alt,
                      size: 26,
                      color: Color(0xff5B6975),
                    ),
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xff5B6975),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45.0),
                  borderSide: const BorderSide(
                    width: 2.0,
                    color: Color(0xff152A3A),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(45.0),
                  borderSide: const BorderSide(
                    width: 2.0,
                    color: Color(0xff152A3A),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
