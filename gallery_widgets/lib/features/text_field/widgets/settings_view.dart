import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/text_field/cubit/text_field_cubit.dart';
import 'package:gallery_widgets/widgets/setting_row.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: BlocBuilder<TextFieldCubit, TextFieldState>(
        builder: (context, state) {
          return ListView(
            children: [
              SettingRow(
                settingType: SettingType.switcher,
                title: 'Hint Text',
                currentValue: state.showHintText,
                onChanged: (value) {
                  context.read<TextFieldCubit>().changeShowHintText(value);
                },
              ),
              SettingRow(
                settingType: SettingType.switcher,
                title: 'Label Text',
                currentValue: state.showLabelText,
                onChanged: (value) {
                  context.read<TextFieldCubit>().changeShowLabelText(value);
                },
              ),
              SettingRow(
                settingType: SettingType.switcher,
                title: 'Help Text',
                currentValue: state.showHelpText,
                onChanged: (value) {
                  context.read<TextFieldCubit>().changeShowHelpText(value);
                },
              ),
              SettingRow(
                settingType: SettingType.switcher,
                title: 'Error Text',
                currentValue: state.showErrorText,
                onChanged: (value) {
                  context.read<TextFieldCubit>().changeShowErrorText(value);
                },
              ),
              SettingRow(
                settingType: SettingType.switcher,
                title: 'Counter Text',
                currentValue: state.showCounterText,
                onChanged: (value) {
                  context.read<TextFieldCubit>().changeShowCounterText(value);
                },
              ),
              SettingRow(
                settingType: SettingType.switcher,
                title: 'Prefix',
                currentValue: state.showPrefix,
                onChanged: (value) {
                  context.read<TextFieldCubit>().changeShowPrefix(value);
                },
              ),
              SettingRow(
                settingType: SettingType.switcher,
                title: 'Suffix',
                currentValue: state.showSuffix,
                onChanged: (value) {
                  context.read<TextFieldCubit>().changeShowSuffix(value);
                },
              ),
              SettingRow(
                settingType: SettingType.switcher,
                title: 'Prefix Icon',
                currentValue: state.showPrefixIcon,
                onChanged: (value) {
                  context.read<TextFieldCubit>().changeShowPrefixIcon(value);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
