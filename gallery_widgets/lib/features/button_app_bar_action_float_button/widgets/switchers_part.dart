import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/button_app_bar_action_float_button/cubit/btn_app_bar_action_float_btn_cubit.dart';
import 'package:gallery_widgets/widgets/setting_row.dart';

class SwitchersPart extends StatelessWidget {
  const SwitchersPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BtnAppBarActionFloatBtnCubit,
        BtnAppBarActionFloatBtnState>(
      buildWhen: (previous, current) {
        return previous.showFloatingActionButton !=
                current.showFloatingActionButton ||
            previous.showNotch != current.showNotch;
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SettingRow<bool>(
              settingType: SettingType.switcher,
              title: 'Floating Action Button',
              currentValue: state.showFloatingActionButton,
              onChanged: (value) {
                context
                    .read<BtnAppBarActionFloatBtnCubit>()
                    .changeShowFloatingActionButton(value ?? false);
              },
            ),
            SettingRow<bool>(
              settingType: SettingType.switcher,
              title: 'Notch',
              currentValue: state.showNotch,
              onChanged: (value) {
                context
                    .read<BtnAppBarActionFloatBtnCubit>()
                    .changeBottomAppBarShowNotchStatus(value ?? false);
              },
            ),
          ],
        );
      },
    );
  }
}
