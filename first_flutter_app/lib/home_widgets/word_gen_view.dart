import 'package:english_words/english_words.dart';
import 'package:first_flutter_app/bloc/app_cubit.dart';
import 'package:first_flutter_app/home_widgets/history_words_viewed.dart';
import 'package:first_flutter_app/home_widgets/word_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WordGenView extends StatelessWidget {
  const WordGenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Center(
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            final pair = state.currentPair ?? WordPair.random();
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: HistoryWordsViewed(
                    listViewedWords: state.history,
                    favorites: state.favorites,
                    historyListKey: context.read<AppCubit>().historyListKey,
                    onFavoriteToggled: context.read<AppCubit>().toggleFavorite,
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
                        context.read<AppCubit>().toggleFavorite(pair);
                      },
                      icon: Icon(
                        state.favorites.contains(pair) ? Icons.favorite : Icons.favorite_border,
                      ),
                      label: const Text('Like'),
                    ),
                    const SizedBox(width: 10),

                    ElevatedButton(
                      onPressed: context.read<AppCubit>().getNext,
                      child: const Text('Next'),
                    ),
                  ],
                ),
                const Spacer(flex: 2),
              ],
            );
          },
        ),
      ),
    );
  }
}
