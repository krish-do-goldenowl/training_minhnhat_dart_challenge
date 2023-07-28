import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stack_align_state.dart';

class StackAlignCubit extends Cubit<StackAlignState> {
  StackAlignCubit() : super(const StackAlignState());

  void onChangeAlignment(Alignment? newValue) {
    emit(state.copyWith(alignment: newValue));
  }

  void onChangeTextDirection(TextDirection? newValue) {
    emit(state.copyWith(textDirection: newValue));
  }

  void onChangeStackFit(StackFit? newValue) {
    emit(state.copyWith(stackFit: newValue));
  }

  void onChangeClip(Clip? newValue) {
    emit(state.copyWith(clip: newValue));
  }
}
