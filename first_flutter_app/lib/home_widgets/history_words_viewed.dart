import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class HistoryWordsViewed extends StatefulWidget {
  const HistoryWordsViewed({
    super.key,
    required this.historyListKey,
    required this.listViewedWords,
    required this.favorites,
    required this.onFavoriteToggled,
  });

  final GlobalKey<AnimatedListState> historyListKey;
  final List<WordPair> listViewedWords;
  final List<WordPair> favorites;
  final Function(WordPair) onFavoriteToggled;

  @override
  State<HistoryWordsViewed> createState() => _HistoryWordsViewedState();
}

class _HistoryWordsViewedState extends State<HistoryWordsViewed> {
  /// Used to "fade out" the history items at the top, to suggest continuation.
  static const Gradient _maskingGradient = LinearGradient(
    // This gradient goes from fully transparent to fully opaque black...
    colors: [Colors.transparent, Colors.black],
    // ... from the top (transparent) to half (0.5) of the way to the bottom.
    stops: [0.0, 0.5],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => _maskingGradient.createShader(bounds),
      // This blend mode takes the opacity of the shader (i.e. our gradient)
      // and applies it to the destination (i.e. our animated list).
      blendMode: BlendMode.dstIn,
      child: AnimatedList(
        key: widget.historyListKey,
        reverse: true,
        padding: const EdgeInsets.only(top: 100),
        initialItemCount: widget.listViewedWords.length,
        itemBuilder: (context, index, animation) {
          final pair = widget.listViewedWords[index];
          return SizeTransition(
            sizeFactor: animation,
            child: Center(
              child: TextButton.icon(
                onPressed: () {
                  widget.onFavoriteToggled(pair);
                },
                icon: widget.favorites.contains(pair)
                    ? const Icon(Icons.favorite, size: 12)
                    : const SizedBox(),
                label: Text(
                  pair.asLowerCase,
                  semanticsLabel: pair.asPascalCase,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}