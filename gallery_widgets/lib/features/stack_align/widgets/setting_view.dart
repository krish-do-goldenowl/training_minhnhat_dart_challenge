import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/widgets/setting_row.dart';

class SettingView extends StatelessWidget {
  const SettingView({
    super.key,
    this.alignment = Alignment.center,
    this.stackFit = StackFit.loose,
    this.textDirection = TextDirection.ltr,
    this.clip = Clip.hardEdge,
    this.onSettingChanged,
  });

  final Alignment alignment;
  final StackFit stackFit;
  final TextDirection textDirection;
  final Clip clip;
  final Function(dynamic, int index)? onSettingChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SettingRow(
            title: 'Alignment',
            currentValue: alignment,
            valueList: const [
              MapEntry('TopLeft', Alignment.topLeft),
              MapEntry('TopCenter', Alignment.topCenter),
              MapEntry('TopRight', Alignment.topRight),
              MapEntry('CenterLeft', Alignment.centerLeft),
              MapEntry('Center', Alignment.center),
              MapEntry('CenterRight', Alignment.centerRight),
              MapEntry('BottomLeft', Alignment.bottomLeft),
              MapEntry('BottomCenter', Alignment.bottomCenter),
              MapEntry('BottomRight', Alignment.bottomRight),
            ],
            onChanged: (value) => onSettingChanged?.call(value, 0),
          ),
          SettingRow(
            title: 'TextDirection',
            currentValue: textDirection,
            valueList: const [
              MapEntry('LTR', TextDirection.ltr),
              MapEntry('RTL', TextDirection.rtl),
            ],
            onChanged: (value) => onSettingChanged?.call(value, 1),
          ),
          SettingRow(
            title: 'StackFit',
            currentValue: stackFit,
            valueList: const [
              MapEntry('Loose', StackFit.loose),
              MapEntry('Expand', StackFit.expand),
              MapEntry('Passthrough', StackFit.passthrough),
            ],
            onChanged: (value) => onSettingChanged?.call(value, 2),
          ),
          SettingRow(
            title: 'Clip',
            currentValue: clip,
            valueList: const [
              MapEntry('None', Clip.none),
              MapEntry('HardEdge', Clip.hardEdge),
              MapEntry('AntiAlias', Clip.antiAlias),
              MapEntry('AntiAliasWithSaveLayer', Clip.antiAliasWithSaveLayer),
            ],
            onChanged: (value) => onSettingChanged?.call(value, 3),
          ),
        ],
      ),
    );
  }
}
