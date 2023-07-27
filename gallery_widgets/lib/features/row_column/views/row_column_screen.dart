import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/row_column/cubit/row_column_cubit.dart';
import 'package:gallery_widgets/features/row_column/views/row_column_view.dart';

class RowColumnScreen extends StatelessWidget {
  const RowColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RowColumnCubit(),
      child: const RowColumnView(),
    );
  }
}
