import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'btn_app_bar_action_float_btn_state.dart';

class BtnAppBarActionFloatBtnCubit extends Cubit<BtnAppBarActionFloatBtnState> {
  BtnAppBarActionFloatBtnCubit() : super(const BtnAppBarActionFloatBtnState());

  void changeShowFloatingActionButton(bool value) {
    emit(state.copyWith(
      showFloatingActionButton: value,
      floatingActionButtonLocation:
          value ? FloatingActionButtonLocation.endDocked : null,
    ));
  }

  void changeBottomAppBarShowNotchStatus(bool value) {
    emit(state.copyWith(showNotch: value));
  }

  void changeFloatingActionButtonLocation(FloatingActionButtonLocation? value) {
    if (state.showFloatingActionButton) {
      emit(state.copyWith(floatingActionButtonLocation: value));
    }
  }
}
