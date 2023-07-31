// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'stack_align_cubit.dart';

class StackAlignState extends Equatable {
  const StackAlignState({
    this.alignment = Alignment.center,
    this.textDirection = TextDirection.ltr,
    this.stackFit = StackFit.loose,
    this.clip = Clip.hardEdge,
  });

  final Alignment alignment;
  final TextDirection textDirection;
  final StackFit stackFit;
  final Clip clip;

  @override
  List<Object> get props => [
        alignment,
        textDirection,
        stackFit,
        clip,
      ];

  StackAlignState copyWith({
    Alignment? alignment,
    TextDirection? textDirection,
    StackFit? stackFit,
    Clip? clip,
  }) {
    return StackAlignState(
      alignment: alignment ?? this.alignment,
      textDirection: textDirection ?? this.textDirection,
      stackFit: stackFit ?? this.stackFit,
      clip: clip ?? this.clip,
    );
  }
}
