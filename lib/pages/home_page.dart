import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_task/model/drug.dart';

import '../widgets/greet_message.dart';
import '../widgets/list_drugs.dart';

class HomePage extends StatefulWidget {
  const HomePage(this.userName, {Key? key}) : super(key: key);

  final String userName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Drug> drugs = [];

  @override
  void initState() {
    super.initState();
    setDrugs();
  }

  void setDrugs() async {
    await getDrugs().then((value) => setState(() => drugs = value));
    print('drugs2 ${drugs}');
  }

  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;
    final bottomPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            GreetMessage(username: widget.userName),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Drugs',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            ListDrugs(drugs: drugs),
          ],
        ),
      )),
    );
  }

  Future getDrugs() async {
    final url = Uri.parse(
        'https://run.mocky.io/v3/839062dd-ed50-4aca-b935-767e629ad30f');

    final res = await http.get(url);
    final responseData = json.decode(res.body);
    print('${responseData['drugs'].map<Drug>((json) => Drug.fromJson(json)).toList()}');
    return responseData['drugs']
        .map<Drug>((json) => Drug.fromJson(json))
        .toList();
  }
}
