import 'package:flutter/material.dart';

import '../models/country.dart';

class Search extends StatefulWidget {
  final Continent continent;

  const Search({required this.continent, super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late Country country;
  late List<ListTile> suggestion;

  @override
  void initState() {
    country = Country(widget.continent);
    suggestion = country.suggest('');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ข้อ 4.
      appBar: AppBar(
          title: const Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:  // ข้อ 5. และ ข้อ 6.
            TextField(
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'name',
              
            ),
          ),
          ),
          Expanded(
            child: ListView // ข้อ 7.
          )
        ],
      ),
    );
  }
}