import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/row_column/cubit/row_column_cubit.dart';
import 'package:gallery_widgets/features/widgets/setting_row.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: BlocBuilder<RowColumnCubit, RowColumnState>(
        builder: (context, state) {
          final cubit = context.read<RowColumnCubit>();
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: _buildRadioRow(cubit: cubit, isRow: state.isRow),
              ),
              SettingRow<MainAxisSize>(
                title: 'mainAxisSize',
                currentValue: state.mainAxisSize,
                valueList: const [
                  MapEntry('max', MainAxisSize.max),
                  MapEntry('min', MainAxisSize.min),
                ],
                onChanged: cubit.onChangeMainAxisSize,
              ),
              SettingRow<MainAxisAlignment>(
                title: 'mainAxisAlignment',
                currentValue: state.mainAxisAlignment,
                valueList: const [
                  MapEntry('start', MainAxisAlignment.start),
                  MapEntry('end', MainAxisAlignment.end),
                  MapEntry('center', MainAxisAlignment.center),
                  MapEntry('spaceBetween', MainAxisAlignment.spaceBetween),
                  MapEntry('spaceAround', MainAxisAlignment.spaceAround),
                  MapEntry('spaceEvenly', MainAxisAlignment.spaceEvenly),
                ],
                onChanged: cubit.onChangeMainAxisAlignment,
              ),
              SettingRow<CrossAxisAlignment>(
                title: 'crossAxisAlignment',
                currentValue: state.crossAxisAlignment,
                valueList: const [
                  MapEntry('start', CrossAxisAlignment.start),
                  MapEntry('end', CrossAxisAlignment.end),
                  MapEntry('center', CrossAxisAlignment.center),
                  MapEntry('stretch', CrossAxisAlignment.stretch),
                  MapEntry('baseline', CrossAxisAlignment.baseline),
                ],
                onChanged: cubit.onChangeCrossAxisAlignment,
              ),
              SettingRow<VerticalDirection>(
                title: 'verticalDirection',
                currentValue: state.verticalDirection,
                valueList: const [
                  MapEntry('down', VerticalDirection.down),
                  MapEntry('up', VerticalDirection.up),
                ],
                onChanged: cubit.onChangeVerticalDirection,
              ),
              SettingRow<TextDirection>(
                title: 'textDirection',
                currentValue: state.textDirection,
                valueList: const [
                  MapEntry('ltr', TextDirection.ltr),
                  MapEntry('rtl', TextDirection.rtl),
                ],
                onChanged: cubit.onChangeTextDirection,
              ),
              SettingRow<TextBaseline>(
                title: 'textBaseline',
                currentValue: state.textBaseline,
                valueList: const [
                  MapEntry('alphabetic', TextBaseline.alphabetic),
                  MapEntry('ideographic', TextBaseline.ideographic),
                ],
                onChanged: cubit.onChangeTextBaseline,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildRadioRow({required RowColumnCubit cubit, required bool isRow}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SettingRow<bool>(
            title: 'Row',
            settingType: SettingType.radio,
            currentValue: true,
            radioGroupValue: isRow,
            onChanged: (value) => cubit.toggleIsRow(),
          ),
        ),
        Expanded(
          child: SettingRow<bool>(
            title: 'Column',
            settingType: SettingType.radio,
            currentValue: false,
            radioGroupValue: isRow,
            onChanged: (value) => cubit.toggleIsRow(),
          ),
        ),
      ],
    );
  }
}
