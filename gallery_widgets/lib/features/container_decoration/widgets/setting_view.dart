import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/widgets/setting_row.dart';

class SettingView extends StatelessWidget {
  const SettingView({
    super.key,
    this.border = false,
    this.borderRadius = 0.0,
    this.boxShadow = false,
    this.background,
    this.backgroundBlendMode = BlendMode.src,
    this.onSettingChanged,
  });

  final bool border;
  final double borderRadius;
  final bool boxShadow;
  final Color? background;
  final BlendMode backgroundBlendMode;
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
            title: 'Border',
            settingType: SettingType.switcher,
            currentValue: border,
            onChanged: (value) => onSettingChanged?.call(value, 0),
          ),
          SettingRow(
            title: 'BorderRadius',
            currentValue: borderRadius,
            dropdownHint: 'None',
            valueList: const [
              MapEntry('None', 0.0),
              MapEntry('10', 10.0),
              MapEntry('20', 20.0),
              MapEntry('30', 30.0),
              MapEntry('40', 40.0),
              MapEntry('50', 50.0),
            ],
            onChanged: (value) => onSettingChanged?.call(value, 1),
          ),
          SettingRow(
            title: 'BoxShadow',
            settingType: SettingType.switcher,
            currentValue: boxShadow,
            onChanged: (value) => onSettingChanged?.call(value, 2),
          ),
          SettingRow(
            title: 'Background',
            currentValue: background,
            dropdownHint: 'Color',
            valueList: const [
              MapEntry('None', null),
              MapEntry('Red', Colors.red),
              MapEntry('Green', Colors.green),
              MapEntry('Blue', Colors.blue),
              MapEntry('Yellow', Colors.yellow),
              MapEntry('Purple', Colors.purple),
            ],
            onChanged: (value) => onSettingChanged?.call(value, 3),
          ),
          SettingRow(
            title: 'BlendMode',
            currentValue: backgroundBlendMode,
            dropdownHint: 'BlendMode',
            valueList: const [
              MapEntry('src', BlendMode.src),
              MapEntry('srcOver', BlendMode.srcOver),
              MapEntry('srcIn', BlendMode.srcIn),
              MapEntry('srcOut', BlendMode.srcOut),
              MapEntry('dst', BlendMode.dst),
              MapEntry('dstOver', BlendMode.dstOver),
              MapEntry('dstIn', BlendMode.dstIn),
              MapEntry('dstOut', BlendMode.dstOut),
              MapEntry('srcATop', BlendMode.srcATop),
              MapEntry('dstATop', BlendMode.dstATop),
              MapEntry('xor', BlendMode.xor),
              MapEntry('plus', BlendMode.plus),
              MapEntry('modulate', BlendMode.modulate),
              MapEntry('screen', BlendMode.screen),
              MapEntry('overlay', BlendMode.overlay),
              MapEntry('darken', BlendMode.darken),
              MapEntry('lighten', BlendMode.lighten),
              MapEntry('colorDodge', BlendMode.colorDodge),
              MapEntry('colorBurn', BlendMode.colorBurn),
              MapEntry('hardLight', BlendMode.hardLight),
              MapEntry('softLight', BlendMode.softLight),
              MapEntry('difference', BlendMode.difference),
              MapEntry('exclusion', BlendMode.exclusion),
              MapEntry('multiply', BlendMode.multiply),
              MapEntry('hue', BlendMode.hue),
              MapEntry('saturation', BlendMode.saturation),
              MapEntry('color', BlendMode.color),
              MapEntry('luminosity', BlendMode.luminosity),
            ],
            onChanged: (value) => onSettingChanged?.call(value, 4),
          ),
        ],
      ),
    );
  }
}
