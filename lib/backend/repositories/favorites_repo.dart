import 'package:english_words/english_words.dart';

/// Repositories rufen Daten entweder lokal oder remote ab
/// Repository hat keinen Zugriff auf Backend oder DB - greift aber auf ein Ressourcen-File zu
/// ? = optional

abstract class FavoritesRepo {
  List<WordPair> getAllFavorites();
  WordPair? createFavorite(WordPair wordPair);
  bool deleteFavorite(WordPair wordPair);
}

class FavoritesRepoImpl implements FavoritesRepo {
  @override
  List<WordPair> getAllFavorites() {
    return [WordPair("Haha", "Hoho"), WordPair("Hehe", "Hihi")];
  }

  @override
  WordPair? createFavorite(WordPair wordPair) {
    return wordPair;
  }

  @override
  bool deleteFavorite(WordPair wordPair) {
    return true;
  }
}