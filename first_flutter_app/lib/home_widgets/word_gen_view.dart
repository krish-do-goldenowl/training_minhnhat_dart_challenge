import 'package:english_words/english_words.dart';
import 'package:first_flutter_app/home_widgets/history_words_viewed.dart';
import 'package:first_flutter_app/home_widgets/word_card.dart';
import 'package:flutter/material.dart';

class WordGenView extends StatelessWidget {
  const WordGenView({
    super.key,
    required this.pair,
    required this.history,
    required this.historyListKey,
    required this.favorites,
    required this.toggleFavorite,
    required this.getNext,
  });

  final WordPair pair;
  final List<WordPair> history;
  final GlobalKey<AnimatedListState> historyListKey;
  final List<WordPair> favorites;
  final Function(WordPair) toggleFavorite;
  final Function() getNext;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: HistoryWordsViewed(
                listViewedWords: history,
                favorites: favorites,
                historyListKey: historyListKey,
                onFavoriteToggled: toggleFavorite,
              ),
            ),
            const SizedBox(height: 10),
            WordCard(pair: pair),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    toggleFavorite(pair);
                  },
                  icon: Icon(favorites.contains(pair) ? Icons.favorite : Icons.favorite_border),
                  label: const Text('Like'),
                ),
                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: getNext,
                  child: const Text('Next'),
                ),
              ],
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
