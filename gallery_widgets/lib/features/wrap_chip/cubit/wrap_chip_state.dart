// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'wrap_chip_cubit.dart';

class WrapChipState extends Equatable {
  const WrapChipState({
    this.selectedChip = -1,
    this.selectedChoiceChip = 1,
    this.selectedInputChip = 2,
    this.elevation = false,
    this.avatar = false,
    this.deleteIcon = false,
    this.shape = const StadiumBorder(),
    this.spacing = true,
    this.runSpacing = false,
  });

  final int selectedChip;
  final int selectedChoiceChip;
  final int selectedInputChip;
  final bool elevation;
  final bool avatar;
  final bool deleteIcon;
  final OutlinedBorder shape;
  final bool spacing;
  final bool runSpacing;

  @override
  List<Object> get props => [
        selectedChip,
        selectedChoiceChip,
        selectedInputChip,
        elevation,
        avatar,
        deleteIcon,
        shape,
        spacing,
        runSpacing,
      ];

  WrapChipState copyWith({
    int? selectedChip,
    int? selectedChoiceChip,
    int? selectedInputChip,
    bool? elevation,
    bool? avatar,
    bool? deleteIcon,
    OutlinedBorder? shape,
    bool? spacing,
    bool? runSpacing,
  }) {
    return WrapChipState(
      selectedChip: selectedChip ?? this.selectedChip,
      selectedChoiceChip: selectedChoiceChip ?? this.selectedChoiceChip,
      selectedInputChip: selectedInputChip ?? this.selectedInputChip,
      elevation: elevation ?? this.elevation,
      avatar: avatar ?? this.avatar,
      deleteIcon: deleteIcon ?? this.deleteIcon,
      shape: shape ?? this.shape,
      spacing: spacing ?? this.spacing,
      runSpacing: runSpacing ?? this.runSpacing,
    );
  }
}
