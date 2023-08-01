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
      child: BlocBuilder<WrapChipCubit, WrapChipState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildRowSetting(
                state: state,
                settingsRow1: SettingRow(
                  settingType: SettingType.switcher,
                  title: 'elevation',
                  currentValue: state.elevation,
                  onChanged: (value) {
                    context.read<WrapChipCubit>().onChangeShowElevation(value);
                  },
                ),
                settingsRow2: SettingRow(
                  settingType: SettingType.switcher,
                  title: 'avatar',
                  currentValue: state.avatar,
                  onChanged: (value) {
                    context.read<WrapChipCubit>().onChangeShowAvatar(value);
                  },
                ),
              ),
              buildRowSetting(
                state: state,
                settingsRow1: SettingRow(
                  settingType: SettingType.switcher,
                  title: 'deleteIcon',
                  currentValue: state.deleteIcon,
                  onChanged: (value) {
                    context.read<WrapChipCubit>().onChangeShowDeleteIcon(value);
                  },
                ),
                settingsRow2: SettingRow<OutlinedBorder>(
                  settingType: SettingType.dropdown,
                  currentValue: state.shape,
                  valueList: const [
                    MapEntry('Circle', CircleBorder()),
                    MapEntry('RoundedRectangle', RoundedRectangleBorder()),
                    MapEntry('Stadium', StadiumBorder()),
                    MapEntry(' BeveledRectangle', BeveledRectangleBorder()),
                    MapEntry(
                        'ContinuousRectangle', ContinuousRectangleBorder()),
                  ],
                  onChanged: (value) {
                    context.read<WrapChipCubit>().onChangeShape(value);
                  },
                ),
              ),
              buildRowSetting(
                state: state,
                settingsRow1: SettingRow<bool>(
                  settingType: SettingType.switcher,
                  title: 'spacing',
                  currentValue: state.spacing,
                  onChanged: (value) {
                    context.read<WrapChipCubit>().onChangeShowSpacing(value);
                  },
                ),
                settingsRow2: SettingRow<bool>(
                  settingType: SettingType.switcher,
                  title: 'runSpacing',
                  currentValue: state.runSpacing,
                  onChanged: (value) {
                    context.read<WrapChipCubit>().onChangeShowRunSpacing(value);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildRowSetting({
    required WrapChipState state,
    required SettingRow settingsRow1,
    required SettingRow settingsRow2,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [settingsRow1, settingsRow2],
    );
  }
}
