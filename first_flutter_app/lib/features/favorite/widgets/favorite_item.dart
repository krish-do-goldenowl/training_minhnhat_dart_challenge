import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
    required this.pair,
    required this.onFavoriteToggled,
  });

  final WordPair pair;
  final Function(WordPair) onFavoriteToggled;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: const Icon(
          Icons.delete_outline,
          semanticLabel: 'Delete',
        ),
        color: Theme.of(context).colorScheme.primary,
        onPressed: () {
          onFavoriteToggled(pair);
        },
      ),
      title: Text(
        pair.asLowerCase,
        semanticsLabel: pair.asPascalCase,
      ),
    );
  }
}
