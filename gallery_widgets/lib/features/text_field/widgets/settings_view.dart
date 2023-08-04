import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/text_field/cubit/text_field_cubit.dart';
import 'package:gallery_widgets/widgets/setting_row.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          BlocBuilder<TextFieldCubit, TextFieldState>(
            buildWhen: (previous, current) =>
                previous.showHintText != current.showHintText,
            builder: (context, state) {
              return SettingRow(
                settingType: SettingType.switcher,
                title: 'Hint Text',
                currentValue: state.showHintText,
                onChanged: (value) {
                  context.read<TextFieldCubit>().changeShowHintText(value);
                },
              );
            },
          ),
          BlocBuilder<TextFieldCubit, TextFieldState>(
            buildWhen: (previous, current) =>
                previous.showLabelText != current.showLabelText,
            builder: (context, state) {
              return SettingRow(
                settingType: SettingType.switcher,
                title: 'Label Text',
                currentValue: state.showLabelText,
                onChanged: (value) {
                  context.read<TextFieldCubit>().changeShowLabelText(value);
                },
              );
            },
          ),
          BlocBuilder<TextFieldCubit, TextFieldState>(
            buildWhen: (previous, current) =>
                previous.showHelpText != current.showHelpText,
            builder: (context, state) {
              return SettingRow(
                settingType: SettingType.switcher,
                title: 'Help Text',
                currentValue: state.showHelpText,
                onChanged: (value) {
                  context.read<TextFieldCubit>().changeShowHelpText(value);
                },
              );
            },
          ),
          BlocBuilder<TextFieldCubit, TextFieldState>(
            buildWhen: (previous, current) =>
                previous.showErrorText != current.showErrorText,
            builder: (context, state) {
              return SettingRow(
                settingType: SettingType.switcher,
                title: 'Error Text',
                currentValue: state.showErrorText,
                onChanged: (value) {
                  context.read<TextFieldCubit>().changeShowErrorText(value);
                },
              );
            },
          ),
          BlocBuilder<TextFieldCubit, TextFieldState>(
            buildWhen: (previous, current) =>
                previous.showCounterText != current.showCounterText,
            builder: (context, state) {
              return SettingRow(
                settingType: SettingType.switcher,
                title: 'Counter Text',
                currentValue: state.showCounterText,
                onChanged: (value) {
                  context.read<TextFieldCubit>().changeShowCounterText(value);
                },
              );
            },
          ),
          BlocBuilder<TextFieldCubit, TextFieldState>(
            buildWhen: (previous, current) =>
                previous.showPrefix != current.showPrefix,
            builder: (context, state) {
              return SettingRow(
                settingType: SettingType.switcher,
                title: 'Prefix',
                currentValue: state.showPrefix,
                onChanged: (value) {
                  context.read<TextFieldCubit>().changeShowPrefix(value);
                },
              );
            },
          ),
          BlocBuilder<TextFieldCubit, TextFieldState>(
            buildWhen: (previous, current) =>
                previous.showSuffix != current.showSuffix,
            builder: (context, state) {
              return SettingRow(
                settingType: SettingType.switcher,
                title: 'Suffix',
                currentValue: state.showSuffix,
                onChanged: (value) {
                  context.read<TextFieldCubit>().changeShowSuffix(value);
                },
              );
            },
          ),
          BlocBuilder<TextFieldCubit, TextFieldState>(
            buildWhen: (previous, current) =>
                previous.showPrefixIcon != current.showPrefixIcon,
            builder: (context, state) {
              return SettingRow(
                settingType: SettingType.switcher,
                title: 'Prefix Icon',
                currentValue: state.showPrefixIcon,
                onChanged: (value) {
                  context.read<TextFieldCubit>().changeShowPrefixIcon(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
