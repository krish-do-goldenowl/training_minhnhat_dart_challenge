import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/stack_align/cubit/stack_align_cubit.dart';
import 'package:gallery_widgets/features/stack_align/widgets/setting_view.dart';

class StackAlignView extends StatelessWidget {
  const StackAlignView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack & Align'),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: SettingView(),
      ),
      body: Center(
        child: BlocBuilder<StackAlignCubit, StackAlignState>(
          builder: (context, state) {
            return Stack(
              alignment: state.alignment,
              fit: state.stackFit,
              clipBehavior: state.clip,
              textDirection: state.textDirection,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  color: Colors.blue,
                ),
                Container(
                  width: 190,
                  height: 190,
                  color: Colors.greenAccent[400],
                ),
                Positioned(
                  right: 0,
                  top: 200,
                  child: Container(
                    width: 120,
                    height: 120,
                    color: Colors.orange,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
