// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'container_decoration_cubit.dart';

class ContainerDecorationState extends Equatable {
  const ContainerDecorationState({
    this.border = false,
    this.borderRadius = 0,
    this.boxShadow = false,
    this.background = Colors.blue,
    this.backgroundBlendMode = BlendMode.srcOver,
  });

  @override
  List<Object> get props => [
        border,
        borderRadius,
        boxShadow,
        background,
        backgroundBlendMode,
      ];

  final bool border;
  final double borderRadius;
  final bool boxShadow;
  final Color background;
  final BlendMode backgroundBlendMode;

  ContainerDecorationState copyWith({
    bool? border,
    double? borderRadius,
    bool? boxShadow,
    Color? background,
    BlendMode? backgroundBlendMode,
  }) {
    return ContainerDecorationState(
      border: border ?? this.border,
      borderRadius: borderRadius ?? this.borderRadius,
      boxShadow: boxShadow ?? this.boxShadow,
      background: background ?? this.background,
      backgroundBlendMode: backgroundBlendMode ?? this.backgroundBlendMode,
    );
  }
}
