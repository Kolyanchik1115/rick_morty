import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('НАСТРОЙКИ', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            SizedBox(height: 10),
            EditContainer(),
            SizedBox(height: 30),
            Divider(color: Color(0xff5B6975)),
            SizedBox(height: 30),
            ThemeWidget(),
            SizedBox(height: 30),
            Divider(color: Color(0xff5B6975)),
            SizedBox(height: 30),
            AppInfo(),
            SizedBox(height: 30),
            Divider(color: Color(0xff5B6975)),
            AppVersion(),
          ],
        ),
      ),
    );
  }
}

class EditContainer extends StatelessWidget {
  const EditContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      color: Colors.transparent,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.transparent,
                foregroundImage: NetworkImage(
                    'https://rickandmortyapi.com/api/character/avatar/1.jpeg'),
                radius: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Text(
                          'Nikolai Chergentsov',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: Colors.white),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Rick',
                            style: Theme.of(context).textTheme.bodySmall!),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11.0),
                      side: const BorderSide(color: Color(0xff22A2BD)),
                    ),
                  ),
                  child: const Text(
                    'Редактировать профиль',
                    style: TextStyle(color: Color(0xff22A2BD)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ВНЕШНИЙ ВИД',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 30),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    'Темная тема',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  content: Text(
                    'Темная тема',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  actions: [ListView()],
                );
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                BoxIcons.bx_palette,
                size: 35,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Text(
                          'Темная тема',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: Colors.white),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: const [
                        Text('Включена'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AppInfo extends StatelessWidget {
  const AppInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'О ПРИЛОЖЕНИИ',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 30),
        Column(
          children: [
            Text(
              'Зигерионцы помещают Джерри и Рика в симуляцию, чтобы узнать секрет изготовления концен-трирован- ной темной материи.',
              softWrap: true,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            )
          ],
        ),
      ],
    );
  }
}

class AppVersion extends StatelessWidget {
  const AppVersion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ВЕРСИЯ ПРИЛОЖЕНИЯ',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 30),
        Column(
          children: [
            Text(
              'Rick & Morty v1.0.0',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            )
          ],
        ),
      ],
    );
  }
}
