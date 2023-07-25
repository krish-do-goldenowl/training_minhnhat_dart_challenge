import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/button/widgets/button_app_bar.dart';
import 'package:gallery_widgets/features/button/widgets/dropdown_dropdown_form.dart';
import 'package:gallery_widgets/features/button/widgets/elevated_buttons.dart';
import 'package:gallery_widgets/features/button/widgets/material_raw_material_button.dart';
import 'package:gallery_widgets/features/button/widgets/option_buttons.dart';
import 'package:gallery_widgets/features/button/widgets/outline_buttons.dart';
import 'package:gallery_widgets/features/button/widgets/text_buttons.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ButtonAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Column(
            children: [
              const DropdownDropdownForm(),
              const SizedBox(height: 5.0),
              IconButton(
                onPressed: () {},
                iconSize: 50,
                icon: const Icon(Icons.add_box_rounded),
              ),
              const SizedBox(height: 5.0),
              const ElevatedButtons(),
              const SizedBox(height: 10.0),
              const TextButtons(),
              const SizedBox(height: 10.0),
              const OutlineButtons(),
              const SizedBox(height: 15.0),
              SizedBox(
                width: double.infinity,
                child: CupertinoButton(
                  onPressed: () {},
                  color: Colors.grey[500],
                  child: const Text('Cupertino Button'),
                ),
              ),
              const SizedBox(height: 15.0),
              const MaterialRawMaterialButton(),
              const SizedBox(height: 15.0),
              const OptionButtons(),
              const SizedBox(height: 15.0),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}
