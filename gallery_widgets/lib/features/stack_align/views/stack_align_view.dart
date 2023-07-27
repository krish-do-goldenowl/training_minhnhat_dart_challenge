import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/stack_align/cubit/stack_align_cubit.dart';
import 'package:gallery_widgets/features/stack_align/widgets/setting_view.dart';

class StackAlignView extends StatefulWidget {
  const StackAlignView({super.key});

  @override
  State<StackAlignView> createState() => _StackAlignViewState();
}

class _StackAlignViewState extends State<StackAlignView> {
  var alignment = Alignment.center;
  var textDirection = TextDirection.ltr;
  var stackFit = StackFit.loose;
  var clip = Clip.hardEdge;

  void onSettingChanged(dynamic newValue, int index) {
    switch (index) {
      case 0:
        setState(() {
          alignment = newValue;
        });
        break;
      case 1:
        setState(() {
          textDirection = newValue;
        });
        break;
      case 2:
        setState(() {
          stackFit = newValue;
        });
        break;
      case 3:
        setState(() {
          clip = newValue;
        });
        break;
      default:
    }
  }

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
