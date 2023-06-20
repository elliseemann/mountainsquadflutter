import 'dart:ffi';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesDetailScreen extends StatelessWidget {
  final List<WordPair> favorites;

  const FavoritesDetailScreen({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: FavoritesPage(favorites: favorites),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  final List<WordPair> favorites;

  const FavoritesPage({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {

    if (favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have ${favorites.length} favorites:'),
        ),
        for (var pair in favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}
