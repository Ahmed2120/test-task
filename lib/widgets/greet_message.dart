import 'package:flutter/material.dart';


class GreetMessage extends StatelessWidget {
  const GreetMessage({
    Key? key,
    required this.username,
  }) : super(key: key);

  final String username;

  static String get greeting {
    DateTime now = DateTime.now();
    int hours = now.hour;
    int minutes = now.minute;

    if (hours >= 1 && hours < 12) {
      return "Good Morning";
    } else if (hours >= 12 && hours <= 16) {
      return "Good Afternoon";
    } else if (hours >= 16 && hours <= 21) {
      return "Good Evening";
    }
    return "Good Night";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          color: Colors.white),
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '$greeting',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Column(
            children: [
              const Text(
                'username:',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '${username}',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}