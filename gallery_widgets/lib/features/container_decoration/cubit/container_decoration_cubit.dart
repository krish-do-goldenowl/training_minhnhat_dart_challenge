import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'container_decoration_state.dart';

class ContainerDecorationCubit extends Cubit<ContainerDecorationState> {
  ContainerDecorationCubit() : super(const ContainerDecorationState());
  void onChangeBorder(bool? newValue) {
    emit(state.copyWith(border: newValue));
  }

  void onChangeBorderRadius(double? newValue) {
    emit(state.copyWith(borderRadius: newValue));
  }

  void onChangeBoxShadow(bool? newValue) {
    emit(state.copyWith(boxShadow: newValue));
  }

  void onChangeBackground(Color? newValue) {
    emit(state.copyWith(background: newValue));
  }

  void onChangeBackgroundBlendMode(BlendMode? newValue) {
    emit(state.copyWith(backgroundBlendMode: newValue));
  }
}
