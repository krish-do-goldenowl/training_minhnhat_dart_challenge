import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/text_field/widgets/settings_view.dart';
import 'package:gallery_widgets/features/text_field/widgets/text_field_2_views.dart';

class TextFieldView extends StatelessWidget {
  const TextFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form View'),
      ),
      bottomNavigationBar: const BottomAppBar(child: TextField2Views()),
      body: const SettingsView(),
    );
  }
}
