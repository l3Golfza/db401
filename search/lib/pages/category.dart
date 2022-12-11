import 'package:flutter/material.dart';

import '../models/country.dart';
import 'search.dart';

class Category extends StatelessWidget {
  const Category({super.key});
  
  get hint => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Countries'),
      ),
      body: Center(
        child: Padding(
        
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Select continent', 
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () => {
               Continent.Europe 
          },
                // ข้อ 2.
                child: const Text('Europe')
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () => {
              Continent.Asia 
          },
                // ข้อ 3.
                child: const Text('Asia')
              ),
            ],
          ),
        ),
      ),
    );
  }
}