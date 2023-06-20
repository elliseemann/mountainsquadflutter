import 'package:english_words/english_words.dart';
import 'package:get/get.dart';
import 'package:mountainsquad_app/backend/use_case/create_favorite_uc.dart';
import 'package:mountainsquad_app/backend/use_case/delete_favorite_uc.dart';
import 'package:mountainsquad_app/backend/use_case/get_all_favorites_uc.dart';
import 'package:mountainsquad_app/dependency_injection/init_locator.dart';

class NavigationViewModel extends GetxController {
  GetAllFavoritesUC _allFavoritesUC = locator();
  CreateFavoriteUC _createFavoriteUC = locator();
  DeleteFavoriteUC _deleteFavoriteUC = locator();

  var current = WordPair.random().obs;
  var favorites = <WordPair>[].obs;
  var selectedIndex = 0.obs;

  void getNext() {
    current.value = WordPair.random();
  }

  void toggleFavorite() {
    if (favorites.contains(current.value)) {
      if (_deleteFavoriteUC.execute(current.value)) {
        favorites.remove(current.value);
      }
    } else {
      final newWordPair = _createFavoriteUC.execute(current.value);
      favorites.add(newWordPair!);
    }
  }

  @override
  void onReady() {
    super.onReady();
    favorites.value = _allFavoritesUC.execute();
  }
}
