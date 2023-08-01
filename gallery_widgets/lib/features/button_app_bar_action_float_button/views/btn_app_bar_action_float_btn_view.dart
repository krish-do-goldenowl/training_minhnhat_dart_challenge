import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/button_app_bar_action_float_button/cubit/cubit/btn_app_bar_action_float_btn_cubit.dart';
import 'package:gallery_widgets/features/button_app_bar_action_float_button/widgets/main_view.dart';

class BtnAppBarActionFloatBtnView extends StatelessWidget {
  const BtnAppBarActionFloatBtnView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BtnAppBarActionFloatBtnCubit,
        BtnAppBarActionFloatBtnState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Bottom App Bar View'),
          ),
          bottomNavigationBar: BottomAppBar(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            shape: state.showNotch ? const CircularNotchedRectangle() : null,
            child: const Row(
              children: [
                Icon(Icons.menu_rounded),
                SizedBox(width: 15),
                Icon(Icons.search_rounded),
                SizedBox(width: 15),
                Icon(Icons.favorite_rounded),
              ],
            ),
          ),
          floatingActionButtonLocation: state.floatingActionButtonLocation,
          floatingActionButton: state.showFloatingActionButton
              ? FloatingActionButton(
                  onPressed: () {},
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                )
              : null,
          body: const MainView(),
        );
      },
    );
  }
}
