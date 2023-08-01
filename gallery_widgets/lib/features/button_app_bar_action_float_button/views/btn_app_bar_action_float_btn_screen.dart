import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/button_app_bar_action_float_button/cubit/cubit/btn_app_bar_action_float_btn_cubit.dart';
import 'package:gallery_widgets/features/button_app_bar_action_float_button/views/btn_app_bar_action_float_btn_view.dart';

class BtnAppBarActionFloatBtnScreen extends StatelessWidget {
  const BtnAppBarActionFloatBtnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BtnAppBarActionFloatBtnCubit(),
      child: const BtnAppBarActionFloatBtnView(),
    );
  }
}
