part of 'app_cubit.dart';

@immutable
class AppState {
  const AppState({
    this.currentPair,
    this.favorites = const <WordPair>[],
    this.history = const <WordPair>[],
  });

  final WordPair? currentPair;
  final List<WordPair> favorites;
  final List<WordPair> history;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          currentPair == other.currentPair &&
          listEquals(favorites, other.favorites) &&
          listEquals(history, other.history);

  @override
  int get hashCode =>
      currentPair.hashCode ^ favorites.hashCode ^ history.hashCode;

  AppState copyWith({
    WordPair? currentPair,
    List<WordPair>? favorites,
    List<WordPair>? history,
  }) {
    return AppState(
      currentPair: currentPair ?? this.currentPair,
      favorites: favorites ?? this.favorites,
      history: history ?? this.history,
    );
  }
}
