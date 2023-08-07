import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/wrap_chip/cubit/wrap_chip_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: ListView(
        children: [
          buildTitle('Chip Chip'),
          buildChipChipWrap(),
          const SizedBox(height: 15),
          buildTitle('Choice Chip'),
          buildChoiceChipWrap(),
          const SizedBox(height: 15),
          buildTitle('Input Chip'),
          buildInputChipWrap(),
        ],
      ),
    );
  }

  double getElevation({bool hasElevation = false}) {
    return hasElevation ? 5.0 : 0.0;
  }

  Color? getDisabledColor() {
    return Colors.grey[200];
  }

  bool getBasicBuildWhen(WrapChipState previous, WrapChipState current) {
    return previous.deleteIcon != current.deleteIcon ||
        previous.avatar != current.avatar ||
        previous.shape != current.shape ||
        previous.elevation != current.elevation;
  }

  Widget buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget? buildAvatar({bool show = true}) {
    return show ? const Icon(Icons.person) : null;
  }

  Widget buildWrapper({required List<Widget> children}) {
    return BlocBuilder<WrapChipCubit, WrapChipState>(
      buildWhen: (previous, current) {
        return previous.spacing != current.spacing ||
            previous.runSpacing != current.runSpacing;
      },
      builder: (context, state) {
        return Wrap(
          spacing: state.spacing ? 15 : 0,
          runSpacing: state.runSpacing ? 10 : 0,
          children: children,
        );
      },
    );
  }

  Widget buildChipChipWrap() {
    Widget buildItem({required int index}) {
      return BlocBuilder<WrapChipCubit, WrapChipState>(
        buildWhen: getBasicBuildWhen,
        builder: (context, state) {
          final deleteFunction = state.deleteIcon ? () {} : null;
          if (index == 0) {
            return Chip(
              elevation: getElevation(hasElevation: state.elevation),
              label: const Text('Chip'),
              avatar: buildAvatar(show: state.avatar),
              shape: state.shape,
              onDeleted: deleteFunction,
            );
          }

          if (index == 1) {
            return ActionChip(
              elevation: getElevation(hasElevation: state.elevation),
              label: const Text('ActionChip'),
              avatar: buildAvatar(show: state.avatar),
              shape: state.shape,
              onPressed: () {},
            );
          }

          return RawChip(
            elevation: getElevation(hasElevation: state.elevation),
            label: const Text('RawChip'),
            avatar: buildAvatar(show: state.avatar),
            shape: state.shape,
            onDeleted: deleteFunction,
          );
        },
      );
    }

    return buildWrapper(
      children: List.generate(3, (index) => buildItem(index: index)),
    );
  }

  Widget buildChoiceChipWrap() {
    Widget buildChoiceChipItem({
      required int index,
      required String label,
    }) {
      return BlocBuilder<WrapChipCubit, WrapChipState>(
        buildWhen: (previous, current) {
          return getBasicBuildWhen(previous, current) ||
              previous.selectedChoiceChip != current.selectedChoiceChip;
        },
        builder: (context, state) {
          final selected = state.selectedChoiceChip == index;
          return ChoiceChip(
            elevation: getElevation(hasElevation: state.elevation),
            label: Text(label),
            labelStyle: TextStyle(color: selected ? Colors.blue[300] : null),
            selectedColor: Colors.blue[50],
            disabledColor: getDisabledColor(),
            avatar: buildAvatar(show: state.avatar),
            shape: state.shape,
            selected: selected,
            onSelected: label == 'Disable'
                ? null
                : (value) {
                    context.read<WrapChipCubit>().onChangeSelectedChip(
                          type: 2,
                          value: index,
                        );
                  },
          );
        },
      );
    }

    return buildWrapper(
      children: List.generate(
        3,
        (index) => buildChoiceChipItem(
          index: index,
          label: index == 0 ? 'Disable' : (index == 1 ? 'Small' : 'Large'),
        ),
      ),
    );
  }

  Widget buildInputChipWrap() {
    Widget buildInputChipItem({
      required int index,
      required String label,
    }) {
      return BlocBuilder<WrapChipCubit, WrapChipState>(
        buildWhen: (previous, current) {
          return getBasicBuildWhen(previous, current) ||
              previous.selectedInputChip != current.selectedInputChip;
        },
        builder: (context, state) {
          final selected = state.selectedInputChip == index;
          final deleteFunction = state.deleteIcon ? () {} : null;
          return InputChip(
            elevation: getElevation(hasElevation: state.elevation),
            label: Text(label),
            avatar: buildAvatar(show: state.avatar),
            onDeleted: label == 'Disable' ? null : deleteFunction,
            selected: selected,
            shape: state.shape,
            disabledColor: getDisabledColor(),
            onSelected: label == 'Disable'
                ? null
                : (value) {
                    context.read<WrapChipCubit>().onChangeSelectedChip(
                          type: 3,
                          value: index,
                        );
                  },
          );
        },
      );
    }

    return buildWrapper(
      children: List.generate(
        3,
        (index) => buildInputChipItem(
          index: index,
          label: index == 0 ? 'Disable' : (index == 1 ? 'ios' : 'Android'),
        ),
      ),
    );
  }
}
