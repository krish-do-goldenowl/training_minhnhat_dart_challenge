import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/row_column/widgets/main_view.dart';
import 'package:gallery_widgets/features/row_column/widgets/setting_view.dart';

class RowColumnView extends StatelessWidget {
  const RowColumnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row & Column'),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: SettingView(),
      ),
      body: Container(
        color: Colors.yellowAccent,
        child: const MainView(),
      ),
    );
  }
}
