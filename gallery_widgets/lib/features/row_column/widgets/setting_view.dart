import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/widgets/setting_row.dart';

class SettingView extends StatelessWidget {
  const SettingView({
    super.key,
    this.isRow = true,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.verticalDirection = VerticalDirection.down,
    this.textDirection = TextDirection.ltr,
    this.textBaseline = TextBaseline.alphabetic,
    this.onSettingChanged,
  });

  final bool isRow;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final VerticalDirection verticalDirection;
  final TextDirection textDirection;
  final TextBaseline textBaseline;
  final Function(dynamic, int index)? onSettingChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: _buildRadioRow(),
          ),
          SettingRow(
            title: 'mainAxisSize',
            currentValue: mainAxisSize,
            valueList: const [
              MapEntry('max', MainAxisSize.max),
              MapEntry('min', MainAxisSize.min),
            ],
            onChanged: (value) => onSettingChanged?.call(value, 1),
          ),
          SettingRow(
            title: 'mainAxisAlignment',
            currentValue: mainAxisAlignment,
            valueList: const [
              MapEntry('start', MainAxisAlignment.start),
              MapEntry('end', MainAxisAlignment.end),
              MapEntry('center', MainAxisAlignment.center),
              MapEntry('spaceBetween', MainAxisAlignment.spaceBetween),
              MapEntry('spaceAround', MainAxisAlignment.spaceAround),
              MapEntry('spaceEvenly', MainAxisAlignment.spaceEvenly),
            ],
            onChanged: (value) => onSettingChanged?.call(value, 2),
          ),
          SettingRow(
            title: 'crossAxisAlignment',
            currentValue: crossAxisAlignment,
            valueList: const [
              MapEntry('start', CrossAxisAlignment.start),
              MapEntry('end', CrossAxisAlignment.end),
              MapEntry('center', CrossAxisAlignment.center),
              MapEntry('stretch', CrossAxisAlignment.stretch),
              MapEntry('baseline', CrossAxisAlignment.baseline),
            ],
            onChanged: (value) => onSettingChanged?.call(value, 3),
          ),
          SettingRow(
            title: 'verticalDirection',
            currentValue: verticalDirection,
            valueList: const [
              MapEntry('down', VerticalDirection.down),
              MapEntry('up', VerticalDirection.up),
            ],
            onChanged: (value) => onSettingChanged?.call(value, 4),
          ),
          SettingRow(
            title: 'textDirection',
            currentValue: textDirection,
            valueList: const [
              MapEntry('ltr', TextDirection.ltr),
              MapEntry('rtl', TextDirection.rtl),
            ],
            onChanged: (value) => onSettingChanged?.call(value, 5),
          ),
          SettingRow(
            title: 'textBaseline',
            currentValue: textBaseline,
            valueList: const [
              MapEntry('alphabetic', TextBaseline.alphabetic),
              MapEntry('ideographic', TextBaseline.ideographic),
            ],
            onChanged: (value) => onSettingChanged?.call(value, 6),
          ),
        ],
      ),
    );
  }

  Widget _buildRadioRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SettingRow(
            title: 'Row',
            settingType: SettingType.radio,
            currentValue: true,
            radioGroupValue: isRow,
            onChanged: (value) => onSettingChanged?.call(value, 0),
          ),
        ),
        Expanded(
          child: SettingRow(
            title: 'Column',
            settingType: SettingType.radio,
            currentValue: false,
            radioGroupValue: isRow,
            onChanged: (value) => onSettingChanged?.call(value, 0),
          ),
        ),
      ],
    );
  }
}
