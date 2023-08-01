// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'text_field_cubit.dart';

class TextFieldState extends Equatable {
  const TextFieldState({
    this.showHintText = true,
    this.showLabelText = true,
    this.showHelpText = false,
    this.showErrorText = true,
    this.showCounterText = false,
    this.showPrefix = false,
    this.showSuffix = false,
    this.showPrefixIcon = false,
  });

  final bool showHintText;
  final bool showLabelText;
  final bool showHelpText;
  final bool showErrorText;
  final bool showCounterText;
  final bool showPrefix;
  final bool showSuffix;
  final bool showPrefixIcon;

  @override
  List<Object> get props => [
        showHintText,
        showLabelText,
        showHelpText,
        showErrorText,
        showCounterText,
        showPrefix,
        showSuffix,
        showPrefixIcon,
      ];

  TextFieldState copyWith({
    bool? showHintText,
    bool? showLabelText,
    bool? showHelpText,
    bool? showErrorText,
    bool? showCounterText,
    bool? showPrefix,
    bool? showSuffix,
    bool? showPrefixIcon,
  }) {
    return TextFieldState(
      showHintText: showHintText ?? this.showHintText,
      showLabelText: showLabelText ?? this.showLabelText,
      showHelpText: showHelpText ?? this.showHelpText,
      showErrorText: showErrorText ?? this.showErrorText,
      showCounterText: showCounterText ?? this.showCounterText,
      showPrefix: showPrefix ?? this.showPrefix,
      showSuffix: showSuffix ?? this.showSuffix,
      showPrefixIcon: showPrefixIcon ?? this.showPrefixIcon,
    );
  }
}
