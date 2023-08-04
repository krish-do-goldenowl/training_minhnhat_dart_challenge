import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/wrap_chip/cubit/wrap_chip_cubit.dart';
import 'package:gallery_widgets/widgets/setting_row.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildElevationSwitcher(),
              buildAvatarSwitcher(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildDeleteIconSwitcher(),
              buildShapeDropdown(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSpacingSwitcher(),
              buildRunSpacingSwitcher(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildElevationSwitcher() {
    return BlocBuilder<WrapChipCubit, WrapChipState>(
      buildWhen: (previous, current) => previous.elevation != current.elevation,
      builder: (context, state) {
        return SettingRow(
          settingType: SettingType.switcher,
          title: 'elevation',
          currentValue: state.elevation,
          onChanged: (value) {
            context.read<WrapChipCubit>().onChangeShowElevation(value);
          },
        );
      },
    );
  }

  Widget buildAvatarSwitcher() {
    return BlocBuilder<WrapChipCubit, WrapChipState>(
      buildWhen: (previous, current) => previous.avatar != current.avatar,
      builder: (context, state) {
        return SettingRow(
          settingType: SettingType.switcher,
          title: 'avatar',
          currentValue: state.avatar,
          onChanged: (value) {
            context.read<WrapChipCubit>().onChangeShowAvatar(value);
          },
        );
      },
    );
  }

  Widget buildDeleteIconSwitcher() {
    return BlocBuilder<WrapChipCubit, WrapChipState>(
      buildWhen: (previous, current) =>
          previous.deleteIcon != current.deleteIcon,
      builder: (context, state) {
        return SettingRow(
          settingType: SettingType.switcher,
          title: 'deleteIcon',
          currentValue: state.deleteIcon,
          onChanged: (value) {
            context.read<WrapChipCubit>().onChangeShowDeleteIcon(value);
          },
        );
      },
    );
  }

  Widget buildShapeDropdown() {
    return BlocBuilder<WrapChipCubit, WrapChipState>(
      buildWhen: (previous, current) => previous.shape != current.shape,
      builder: (context, state) {
        return SettingRow<OutlinedBorder>(
          settingType: SettingType.dropdown,
          currentValue: state.shape,
          valueList: const [
            MapEntry('Circle', CircleBorder()),
            MapEntry('RoundedRectangle', RoundedRectangleBorder()),
            MapEntry('Stadium', StadiumBorder()),
            MapEntry(' BeveledRectangle', BeveledRectangleBorder()),
            MapEntry('ContinuousRectangle', ContinuousRectangleBorder()),
          ],
          onChanged: (value) {
            context.read<WrapChipCubit>().onChangeShape(value);
          },
        );
      },
    );
  }

  Widget buildSpacingSwitcher() {
    return BlocBuilder<WrapChipCubit, WrapChipState>(
      buildWhen: (previous, current) => previous.spacing != current.spacing,
      builder: (context, state) {
        return SettingRow<bool>(
          settingType: SettingType.switcher,
          title: 'spacing',
          currentValue: state.spacing,
          onChanged: (value) {
            context.read<WrapChipCubit>().onChangeShowSpacing(value);
          },
        );
      },
    );
  }

  Widget buildRunSpacingSwitcher() {
    return BlocBuilder<WrapChipCubit, WrapChipState>(
      buildWhen: (previous, current) =>
          previous.runSpacing != current.runSpacing,
      builder: (context, state) {
        return SettingRow<bool>(
          settingType: SettingType.switcher,
          title: 'runSpacing',
          currentValue: state.runSpacing,
          onChanged: (value) {
            context.read<WrapChipCubit>().onChangeShowRunSpacing(value);
          },
        );
      },
    );
  }
}
