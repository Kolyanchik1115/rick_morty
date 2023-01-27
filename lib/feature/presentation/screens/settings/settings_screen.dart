import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:rick_morty/common/network_images.dart';

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
                    NetworkImages.avatar),
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
          onTap: () {},
          child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
              leading: const Icon(
                BoxIcons.bx_palette,
                color: Colors.white,
                size: 40,
              ),
              title: const Text(' Темная тема',
                  style: TextStyle(color: Colors.white)),
              subtitle: Row(
                children: [
                  Text(' Включена',
                      style: Theme.of(context).textTheme.bodySmall)
                ],
              ),
              trailing: const Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 30.0)),
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
