import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/row_column/cubit/row_column_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  List<Widget> getChildren() {
    return const [
      Icon(Icons.brightness_auto, size: 25),
      Icon(Icons.brightness_auto, size: 50),
      Icon(Icons.brightness_auto, size: 25),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RowColumnCubit, RowColumnState>(
      builder: (context, state) {
        final isRow = state.isRow;
        final mainAxisAlignment = state.mainAxisAlignment;
        final mainAxisSize = state.mainAxisSize;
        final crossAxisAlignment = state.crossAxisAlignment;
        final verticalDirection = state.verticalDirection;
        final textDirection = state.textDirection;
        final textBaseline = state.textBaseline;

        if (isRow) {
          return Row(
            mainAxisAlignment: mainAxisAlignment,
            mainAxisSize: mainAxisSize,
            crossAxisAlignment: crossAxisAlignment,
            verticalDirection: verticalDirection,
            textDirection: textDirection,
            textBaseline: textBaseline,
            children: getChildren(),
          );
        }

        return Column(
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          verticalDirection: verticalDirection,
          textDirection: textDirection,
          textBaseline: textBaseline,
          children: getChildren(),
        );
      },
    );
  }
}
