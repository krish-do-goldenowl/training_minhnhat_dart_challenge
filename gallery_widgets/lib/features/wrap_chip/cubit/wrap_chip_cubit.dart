import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wrap_chip_state.dart';

class WrapChipCubit extends Cubit<WrapChipState> {
  WrapChipCubit() : super(const WrapChipState());

  void onChangeSelectedChip({int type = 1, int? value}) {
    emit(state.copyWith(
      selectedChip: type == 1 ? value : null,
      selectedChoiceChip: type == 2 ? value : null,
      selectedInputChip: type == 3 ? value : null,
    ));
  }

  void onChangeShowElevation(bool? value) {
    emit(state.copyWith(elevation: value));
  }

  void onChangeShowAvatar(bool? value) {
    emit(state.copyWith(avatar: value));
  }

  void onChangeShowDeleteIcon(bool? value) {
    emit(state.copyWith(deleteIcon: value));
  }

  void onChangeShape(OutlinedBorder? value) {
    emit(state.copyWith(shape: value));
  }

  void onChangeShowSpacing(bool? value) {
    emit(state.copyWith(spacing: value));
  }

  void onChangeShowRunSpacing(bool? value) {
    emit(state.copyWith(runSpacing: value));
  }
}
