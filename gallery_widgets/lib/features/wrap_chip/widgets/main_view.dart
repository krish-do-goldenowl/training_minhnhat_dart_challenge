import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/wrap_chip/cubit/wrap_chip_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: BlocBuilder<WrapChipCubit, WrapChipState>(
        builder: (context, state) {
          return ListView(
            children: [
              buildChipPart(
                chipType: 1,
                state: state,
                title: 'Chip Chip',
                chipTexts: ['Chip', 'ActionChip', 'RawChip'],
                selectedIndex: state.selectedChip,
                onSelected: (index) {
                  context.read<WrapChipCubit>().onChangeSelectedChip(
                        type: 1,
                        value: index,
                      );
                },
              ),
              const SizedBox(height: 15),
              buildChipPart(
                chipType: 2,
                state: state,
                title: 'Choice Chip',
                chipTexts: ['Disable', 'Small', 'Large'],
                selectedIndex: state.selectedChoiceChip,
                onSelected: (index) {
                  context.read<WrapChipCubit>().onChangeSelectedChip(
                        type: 2,
                        value: index,
                      );
                },
              ),
              const SizedBox(height: 15),
              buildChipPart(
                chipType: 3,
                state: state,
                title: 'Input Chip',
                chipTexts: ['Disable', 'ios', 'Android'],
                selectedIndex: state.selectedInputChip,
                onSelected: (index) {
                  context.read<WrapChipCubit>().onChangeSelectedChip(
                        type: 3,
                        value: index,
                      );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildChipPart({
    required int chipType,
    required String title,
    required List<String> chipTexts,
    required int selectedIndex,
    required Function(int) onSelected,
    required WrapChipState state,
  }) {
    Widget buildChipItem({
      required String text,
      Function(int)? onSelected,
      required int index,
    }) {
      final deleteFunction = state.deleteIcon ? () {} : null;
      final selectedColor = Colors.blue[50];
      final selectedTextColor =
          index == selectedIndex ? Colors.blue[300] : null;
      final disableColor = Colors.grey[200];
      final elevation = state.elevation ? 5.0 : 0.0;
      const Widget avatar = Icon(Icons.person);
      final Widget textWidget = Text(text);

      if (chipType == 1) {
        if (index == 0) {
          return Chip(
            elevation: elevation,
            label: textWidget,
            avatar: state.avatar ? avatar : null,
            onDeleted: deleteFunction,
            shape: state.shape,
          );
        }
        if (index == 1) {
          return ActionChip(
            elevation: elevation,
            label: textWidget,
            avatar: state.avatar ? avatar : null,
            shape: state.shape,
            onPressed: () {},
          );
        }
        return RawChip(
          elevation: elevation,
          label: textWidget,
          avatar: state.avatar ? avatar : null,
          onDeleted: deleteFunction,
          shape: state.shape,
        );
      }

      if (chipType == 2) {
        return ChoiceChip(
          elevation: elevation,
          label: textWidget,
          labelStyle: TextStyle(color: selectedTextColor),
          avatar: state.avatar ? avatar : null,
          selected: index == selectedIndex,
          shape: state.shape,
          selectedColor: selectedColor,
          disabledColor: disableColor,
          onSelected: onSelected != null ? (value) => onSelected(index) : null,
        );
      }

      return InputChip(
        elevation: elevation,
        label: textWidget,
        avatar: state.avatar ? avatar : null,
        onDeleted: onSelected != null ? deleteFunction : null,
        selected: index == selectedIndex,
        shape: state.shape,
        disabledColor: disableColor,
        onSelected: onSelected != null ? (value) => onSelected(index) : null,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Wrap(
          spacing: state.spacing ? 15 : 0,
          runSpacing: state.runSpacing ? 10 : 0,
          children: List.generate(
            chipTexts.length,
            (index) => buildChipItem(
              text: chipTexts[index],
              index: index,
              onSelected: (chipType == 1 || chipTexts[index] == 'Disable')
                  ? null
                  : onSelected,
            ),
          ),
        ),
      ],
    );
  }
}
