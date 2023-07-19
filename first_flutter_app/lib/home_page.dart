import 'package:english_words/english_words.dart';
import 'package:first_flutter_app/favorite_page.dart';
import 'package:first_flutter_app/home_widgets/word_gen_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pair = WordPair.random();
  var favorites = <WordPair>[];
  var history = <WordPair>[];
  final historyListKey = GlobalKey<AnimatedListState>();

  void getNext() {
    setState(() {
      history.insert(0, pair);
      var animatedList = historyListKey.currentState;
      animatedList?.insertItem(0);
      pair = WordPair.random();
    });
  }

  void toggleFavorite(WordPair togglePair) {
    setState(() {
      if (favorites.contains(togglePair)) {
        favorites.remove(togglePair);
      } else {
        favorites.add(togglePair);
      }
    });
  }

  void onFavoriteTabTapped() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FavoritePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (context, constraints) {
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
          }
      ),
    );
  }
}
