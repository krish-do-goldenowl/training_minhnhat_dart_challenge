import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/wrap_chip/widgets/main_view.dart';
import 'package:gallery_widgets/features/wrap_chip/widgets/settings_view.dart';

class WrapChipView extends StatelessWidget {
  const WrapChipView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wrap View'),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: SettingsView(),
      ),
      body: const MainView(),
    );
  }
}
