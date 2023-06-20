import 'package:get_it/get_it.dart';
import 'package:mountainsquad_app/backend/repositories/favorites_repo.dart';
import 'package:mountainsquad_app/backend/use_case/create_favorite_uc.dart';
import 'package:mountainsquad_app/backend/use_case/delete_favorite_uc.dart';
import 'package:mountainsquad_app/backend/use_case/get_all_favorites_uc.dart';

/// Automatisches Einfügen von Abhängigkeiten in zB. eine Klasse
/// Mockt auch zB. Use Cases für das Testen von ViewModels
/// typensicher durch abstract classes and implementation
///
GetIt locator = GetIt.I;
void initLocator() {
  // Use-Cases
  locator.registerFactory<GetAllFavoritesUC>(() => GetAllFavoritesUCImpl());
  locator.registerFactory<DeleteFavoriteUC>(() => DeleteFavoriteUCImpl());
  locator.registerFactory<CreateFavoriteUC>(() => CreateFavoriteUCImpl());

  // Repositories
  locator.registerFactory<FavoritesRepo>(() => FavoritesRepoImpl());
}