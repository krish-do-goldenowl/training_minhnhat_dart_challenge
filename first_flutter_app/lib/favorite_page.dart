import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({
    super.key, required this.favorites, required this.onFavoriteToggled,
  });

  final List<WordPair> favorites;
  final Function(WordPair) onFavoriteToggled;

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final currentFavorites = <WordPair>[];

  @override
  void initState() {
    super.initState();
    currentFavorites.addAll(widget.favorites);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primaryContainer,
        title: const Text('Favorites'),
      ),
      body: currentFavorites.isEmpty
          ? const Center(
        child: Text('No favorites yet'),
      )
          :Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
                'You have ${currentFavorites.length} favorites',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                )
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.1,
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  childAspectRatio: 400 / 80,
                ),
                itemCount: currentFavorites.length,
                itemBuilder: (context, index) {
                  final pair = currentFavorites[index];
                  return ListTile(
                    leading: IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        semanticLabel: 'Delete',
                      ),
                      color: theme.colorScheme.primary,
                      onPressed: () {
                        widget.onFavoriteToggled(pair);
                        setState(() {
                          currentFavorites.remove(pair);
                        });
                      },
                    ),
                    title: Text(
                      pair.asLowerCase,
                      semanticsLabel: pair.asPascalCase,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}