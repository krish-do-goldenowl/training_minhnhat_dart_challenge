import 'package:first_flutter_app/features/favorite/view/favorite_view.dart';
import 'package:first_flutter_app/features/home/widgets/word_gen_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void onFavoriteTabTapped() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FavoriteView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth >= 450) {
          return Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 600,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite),
                      label: Text('Favorites'),
                    ),
                  ],
                  selectedIndex: 0,
                  onDestinationSelected: (value) {
                    if (value == 1) {
                      onFavoriteTabTapped();
                    }
                  },
                ),
              ),
              const Expanded(child: WordGenView()),
            ],
          );
        }

        return Column(
          children: [
            const Expanded(child: WordGenView()),
            SafeArea(
              child: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favorites',
                  ),
                ],
                currentIndex: 0,
                onTap: (value) {
                  if (value == 1) {
                    onFavoriteTabTapped();
                  }
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
