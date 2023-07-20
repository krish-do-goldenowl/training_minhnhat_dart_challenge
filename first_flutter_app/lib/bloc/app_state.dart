part of 'app_cubit.dart';

@immutable
class AppState extends Equatable {
  const AppState({
    this.currentPair,
    this.favorites = const <WordPair>[],
    this.history = const <WordPair>[],
  });

  final WordPair? currentPair;
  final List<WordPair> favorites;
  final List<WordPair> history;

  @override
  List<Object?> get props => [
    currentPair,
    favorites,
    history,
  ];

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
