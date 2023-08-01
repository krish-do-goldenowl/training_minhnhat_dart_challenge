import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/button_app_bar_action_float_button/cubit/btn_app_bar_action_float_btn_cubit.dart';
import 'package:gallery_widgets/widgets/setting_row.dart';

class RadioButtonsPart extends StatelessWidget {
  const RadioButtonsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BtnAppBarActionFloatBtnCubit,
        BtnAppBarActionFloatBtnState>(
      buildWhen: (previous, current) {
        return previous.floatingActionButtonLocation !=
                current.floatingActionButtonLocation ||
            previous.showFloatingActionButton !=
                current.showFloatingActionButton;
      },
      builder: (context, state) {
        if (state.showFloatingActionButton == false) {
          return const SizedBox();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Floating Action Button Position',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SettingRow<FloatingActionButtonLocation>(
              settingType: SettingType.radio,
              title: 'Docked - End',
              currentValue: FloatingActionButtonLocation.endDocked,
              radioGroupValue: state.floatingActionButtonLocation,
              onChanged: (value) {
                context
                    .read<BtnAppBarActionFloatBtnCubit>()
                    .changeFloatingActionButtonLocation(value);
              },
            ),
            const SizedBox(height: 10),
            SettingRow<FloatingActionButtonLocation>(
              settingType: SettingType.radio,
              title: 'Docked - Center',
              currentValue: FloatingActionButtonLocation.centerDocked,
              radioGroupValue: state.floatingActionButtonLocation,
              onChanged: (value) {
                context
                    .read<BtnAppBarActionFloatBtnCubit>()
                    .changeFloatingActionButtonLocation(value);
              },
            ),
            const SizedBox(height: 10),
            SettingRow<FloatingActionButtonLocation>(
              settingType: SettingType.radio,
              title: 'Floating - End',
              currentValue: FloatingActionButtonLocation.endFloat,
              radioGroupValue: state.floatingActionButtonLocation,
              onChanged: (value) {
                context
                    .read<BtnAppBarActionFloatBtnCubit>()
                    .changeFloatingActionButtonLocation(value);
              },
            ),
            const SizedBox(height: 10),
            SettingRow<FloatingActionButtonLocation>(
              settingType: SettingType.radio,
              title: 'Floating - Center',
              currentValue: FloatingActionButtonLocation.centerFloat,
              radioGroupValue: state.floatingActionButtonLocation,
              onChanged: (value) {
                context
                    .read<BtnAppBarActionFloatBtnCubit>()
                    .changeFloatingActionButtonLocation(value);
              },
            ),
          ],
        );
      },
    );
  }
}
