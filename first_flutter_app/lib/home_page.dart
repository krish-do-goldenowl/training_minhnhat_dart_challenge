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
        builder: (context) => FavoritePage(
          favorites: favorites,
          onFavoriteToggled: (togglePair) {
            toggleFavorite(togglePair);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mainView = WordGenView(
      pair: pair,
      history: history,
      historyListKey: historyListKey,
      favorites: favorites,
      toggleFavorite: toggleFavorite,
      getNext: getNext,
    );
    return LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            body: constraints.maxWidth >= 450
                ? Row(
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
                Expanded(child: mainView),
              ],
            )
                : Column(
              children: [
                Expanded(child: mainView),
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
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        }
    );
  }
}