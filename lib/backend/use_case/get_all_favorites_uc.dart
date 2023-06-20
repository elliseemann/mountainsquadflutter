import 'package:english_words/english_words.dart';
import 'package:mountainsquad_app/backend/repositories/favorites_repo.dart';
import 'package:mountainsquad_app/dependency_injection/init_locator.dart';

/// Use Case - globale Methoden, die immer wieder verwendet werden
/// Use Cases können sich selbst aufrufen
/// Use Cases werden meist von ViewModels aufgerufen
/// Use Cases greifen nie auf ViewModels zu, jedoch auf Repositories
///

abstract class GetAllFavoritesUC {
  List<WordPair> execute();
}

class GetAllFavoritesUCImpl implements GetAllFavoritesUC {
  FavoritesRepo _favoritesRepo = locator();

  @override
  List<WordPair> execute() {
    return _favoritesRepo.getAllFavorites();
  }
}