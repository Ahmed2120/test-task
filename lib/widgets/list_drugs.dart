import 'package:flutter/material.dart';

import '../model/drug.dart';

class ListDrugs extends StatelessWidget {
  const ListDrugs({
    Key? key,
    required this.drugs,
  }) : super(key: key);

  final List<Drug> drugs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: drugs.length,
        itemBuilder: (context, index) => Container(
          height: 200,
          width: 500,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
              color: Colors.white),
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Name: ${drugs[index].name}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Dose: ${drugs[index].dose}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Strength: ${drugs[index].strength}',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ));
  }
}