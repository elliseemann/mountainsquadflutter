import 'package:english_words/english_words.dart';
import 'package:mountainsquad_app/backend/repositories/favorites_repo.dart';
import 'package:mountainsquad_app/dependency_injection/init_locator.dart';

/// Use Case - globale Methoden, die immer wieder verwendet werden
/// Use Cases können sich selbst aufrufen
/// Use Cases werden meist von ViewModels aufgerufen
/// Use Cases greifen nie auf ViewModels zu, jedoch auf Repositories
///

abstract class CreateFavoriteUC {
  WordPair? execute(WordPair wordPair);
}

class CreateFavoriteUCImpl implements CreateFavoriteUC {
  FavoritesRepo _favoritesRepo = locator();

  @override
  WordPair? execute(WordPair wordPair) {
    return _favoritesRepo.createFavorite(wordPair);
  }
}
