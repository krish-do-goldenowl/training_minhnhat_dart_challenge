import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/container_decoration/cubit/container_decoration_cubit.dart';
import 'package:gallery_widgets/features/container_decoration/views/container_decoration_view.dart';

class ContainerDecorationScreen extends StatelessWidget {
  const ContainerDecorationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContainerDecorationCubit(),
      child: const ContainerDecorationView(),
    );
  }
}
