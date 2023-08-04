import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'text_field_state.dart';

class TextFieldCubit extends Cubit<TextFieldState> {
  TextFieldCubit() : super(const TextFieldState());

  void changeShowHintText(bool? value) {
    emit(state.copyWith(showHintText: value));
  }

  void changeShowLabelText(bool? value) {
    emit(state.copyWith(showLabelText: value));
  }

  void changeShowHelpText(bool? value) {
    emit(state.copyWith(showHelpText: value));
  }

  void changeShowErrorText(bool? value) {
    emit(state.copyWith(showErrorText: value));
  }

  void changeShowCounterText(bool? value) {
    emit(state.copyWith(showCounterText: value));
  }

  void changeShowPrefix(bool? value) {
    emit(state.copyWith(showPrefix: value));
  }

  void changeShowSuffix(bool? value) {
    emit(state.copyWith(showSuffix: value));
  }

  void changeShowPrefixIcon(bool? value) {
    emit(state.copyWith(showPrefixIcon: value));
  }
}
