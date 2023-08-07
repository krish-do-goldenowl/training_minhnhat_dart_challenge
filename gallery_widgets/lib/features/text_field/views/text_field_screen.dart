import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/text_field/cubit/text_field_cubit.dart';
import 'package:gallery_widgets/features/text_field/views/text_field_view.dart';

class TextFieldScreen extends StatelessWidget {
  const TextFieldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextFieldCubit(),
      child: const TextFieldView(),
    );
  }
}
