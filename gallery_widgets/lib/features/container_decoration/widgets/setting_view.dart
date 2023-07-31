import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/container_decoration/cubit/container_decoration_cubit.dart';
import 'package:gallery_widgets/features/widgets/setting_row.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 5.0,
      ),
      child: BlocBuilder<ContainerDecorationCubit, ContainerDecorationState>(
        builder: (context, state) {
          final cubit = context.read<ContainerDecorationCubit>();
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SettingRow(
                title: 'Border',
                isSwitch: true,
                currentValue: state.border,
                onChanged: (value) => cubit.onChangeBorder(value),
              ),
              SettingRow(
                title: 'BorderRadius',
                currentValue: state.borderRadius,
                dropdownHint: 'None',
                valueList: const [
                  MapEntry('None', 0.0),
                  MapEntry('10', 10.0),
                  MapEntry('20', 20.0),
                  MapEntry('30', 30.0),
                  MapEntry('40', 40.0),
                  MapEntry('50', 50.0),
                ],
                onChanged: (value) => cubit.onChangeBorderRadius(value),
              ),
              SettingRow(
                title: 'BoxShadow',
                isSwitch: true,
                currentValue: state.boxShadow,
                onChanged: (value) => cubit.onChangeBoxShadow(value),
              ),
              SettingRow(
                title: 'Background',
                currentValue: state.background,
                dropdownHint: 'Color',
                valueList: const [
                  MapEntry('None', Colors.transparent),
                  MapEntry('Red', Colors.red),
                  MapEntry('Green', Colors.green),
                  MapEntry('Blue', Colors.blue),
                  MapEntry('Yellow', Colors.yellow),
                  MapEntry('Purple', Colors.purple),
                ],
                onChanged: (value) => cubit.onChangeBackground(value),
              ),
              SettingRow(
                title: 'BlendMode',
                currentValue: state.backgroundBlendMode,
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
                onChanged: (value) => cubit.onChangeBackgroundBlendMode(value),
              ),
            ],
          );
        },
      ),
    );
  }
}
