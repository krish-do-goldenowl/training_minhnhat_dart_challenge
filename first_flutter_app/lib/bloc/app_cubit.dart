import 'package:english_words/english_words.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState(currentPair: WordPair.random()));

  final historyListKey = GlobalKey<AnimatedListState>();

  void emitState(AppState newState) {
    if (!isClosed) {
      emit(newState);
    }
  }

  void getNext() {
    final currentPair = state.currentPair;
    var animatedList = historyListKey.currentState;
    animatedList?.insertItem(0);
    emitState(state.copyWith(
      history: currentPair != null ? [currentPair, ...state.history] : null,
      currentPair: WordPair.random(),
    ));
  }

  void toggleFavorite(WordPair togglePair) {
    final favorites = state.favorites.map((e) => e).toList();
    if (favorites.contains(togglePair)) {
      favorites.remove(togglePair);
    } else {
      favorites.add(togglePair);
    }
    emitState(state.copyWith(favorites: favorites.map((e) => e).toList()));
  }
}
