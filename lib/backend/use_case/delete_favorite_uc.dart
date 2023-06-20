import 'package:english_words/english_words.dart';

import '../../dependency_injection/init_locator.dart';
import '../repositories/favorites_repo.dart';

/// Use Case - globale Methoden, die immer wieder verwendet werden
/// Use Cases können sich selbst aufrufen
/// Use Cases werden meist von ViewModels aufgerufen
/// Use Cases greifen nie auf ViewModels zu, jedoch auf Repositories
///

abstract class DeleteFavoriteUC {
  bool execute(WordPair wordPair);
}

class DeleteFavoriteUCImpl implements DeleteFavoriteUC {
  FavoritesRepo _favoritesRepo = locator();

  @override
  bool execute(WordPair wordPair) {
    return _favoritesRepo.deleteFavorite(wordPair);
  }
}