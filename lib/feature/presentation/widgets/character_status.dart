import 'package:flutter/material.dart';

enum LiveState { alive, dead, unknown }

class CharacterStatus extends StatelessWidget {
  final LiveState liveState;
  const CharacterStatus({Key? key, required this.liveState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          liveState == LiveState.dead
              ? 'МЕРТВЫЙ'
              : liveState == LiveState.alive
                  ? 'ЖИВОЙ'
                  : 'НЕИЗВЕСТНО',
          style: TextStyle(
            fontSize: 12,
            color: liveState == LiveState.alive
                ? Colors.lightGreenAccent[400]
                : liveState == LiveState.dead
                    ? Colors.red
                    : Colors.white,
          ),
        ),
      ],
    );
  }
}
