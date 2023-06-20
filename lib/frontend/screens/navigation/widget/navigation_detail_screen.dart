import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mountainsquad_app/frontend/screens/favorites/widget/favorites_detail_screen.dart';
import 'navigation_viewmodel.dart';

class InitialScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavigationViewModel>(() => NavigationViewModel(),fenix: true);
  }
}

class NavigationDetailScreen extends GetView<NavigationViewModel> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Row(
          children: [
            NavigationRailSection(selectedIndex: controller.selectedIndex.value,
                onIndexChanged:(newIndex) {
                  controller.selectedIndex.value = newIndex;
                }),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: Stack (children: [
                  if(controller.selectedIndex.value == 0) NavigationPage()
                  else FavoritesDetailScreen(favorites: controller.favorites)
                ],)
              ),
            ),
          ],
        );
      }),
    );
  }
}

class NavigationRailSection extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onIndexChanged;

  const NavigationRailSection({super.key, required this.selectedIndex, required this.onIndexChanged});

  @override
  State<NavigationRailSection> createState() => _NavigationRailSectionState();
}

class _NavigationRailSectionState extends State<NavigationRailSection> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NavigationRail(
        destinations: [
          NavigationRailDestination(
            icon: Icon(Icons.home),
            label: Text('Home'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.favorite),
            label: Text('Favorites'),
          ),
        ],
        selectedIndex: widget.selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            widget.onIndexChanged(value);
          });
        },
      ),
    );
  }
}

class NavigationPage extends StatelessWidget {
  final NavigationViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final pair = viewModel.current.value;
      final isFavorite = viewModel.favorites.contains(pair);

      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(pair: pair),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    viewModel.toggleFavorite();
                  },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                  ),
                  label: Text('Like'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getNext();
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.titleLarge!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}
