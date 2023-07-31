import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/container_decoration/cubit/container_decoration_cubit.dart';
import 'package:gallery_widgets/features/container_decoration/widgets/setting_view.dart';

class ContainerDecorationView extends StatelessWidget {
  const ContainerDecorationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container View'),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: SettingView(),
      ),
      body: BlocBuilder<ContainerDecorationCubit, ContainerDecorationState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 50.0,
            ),
            decoration: BoxDecoration(
              border: state.border
                  ? Border.all(
                      color: Colors.black,
                      width: 2.0,
                    )
                  : null,
              borderRadius: BorderRadius.circular(state.borderRadius),
              boxShadow: state.boxShadow
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10.0,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : null,
              backgroundBlendMode: state.backgroundBlendMode,
              color: state.background,
            ),
          );
        },
      ),
    );
  }
}
