import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/wrap_chip/cubit/wrap_chip_cubit.dart';
import 'package:gallery_widgets/features/wrap_chip/views/wrap_chip_view.dart';

class WrapChipScreen extends StatelessWidget {
  const WrapChipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WrapChipCubit(),
      child: const WrapChipView(),
    );
  }
}
