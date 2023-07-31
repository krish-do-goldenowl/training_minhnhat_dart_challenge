// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'row_column_cubit.dart';

@immutable
class RowColumnState extends Equatable {
  const RowColumnState({
    this.isRow = true,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.verticalDirection = VerticalDirection.down,
    this.textDirection = TextDirection.ltr,
    this.textBaseline = TextBaseline.alphabetic,
  });

  @override
  List<Object?> get props => [
        isRow,
        mainAxisAlignment,
        mainAxisSize,
        crossAxisAlignment,
        verticalDirection,
        textDirection,
        textBaseline,
      ];

  final bool isRow;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final VerticalDirection verticalDirection;
  final TextDirection textDirection;
  final TextBaseline textBaseline;

  RowColumnState copyWith({
    bool? isRow,
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    CrossAxisAlignment? crossAxisAlignment,
    VerticalDirection? verticalDirection,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
  }) {
    return RowColumnState(
      isRow: isRow ?? this.isRow,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      mainAxisSize: mainAxisSize ?? this.mainAxisSize,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      verticalDirection: verticalDirection ?? this.verticalDirection,
      textDirection: textDirection ?? this.textDirection,
      textBaseline: textBaseline ?? this.textBaseline,
    );
  }
}
