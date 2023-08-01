import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_widgets/features/text_field/cubit/cubit/text_field_cubit.dart';

class TextField2Views extends StatelessWidget {
  const TextField2Views({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: BlocBuilder<TextFieldCubit, TextFieldState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTextField(state: state),
              const SizedBox(height: 20),
              buildTextField(hasBorder: true, state: state),
            ],
          );
        },
      ),
    );
  }

  Widget buildTextField(
      {bool hasBorder = false, required TextFieldState state}) {
    Widget buildTextPreOrSuffix(String text) {
      return Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.amber,
        ),
      );
    }

    return TextField(
        decoration: InputDecoration(
      hintText: state.showHintText ? 'Hint Text' : null,
      labelText: state.showLabelText ? 'Label Text' : null,
      helperText: state.showHelpText ? 'Help Text' : null,
      errorText: state.showErrorText ? 'Error Text' : null,
      counterText: state.showCounterText ? 'Counter Text' : null,
      prefix:
          state.showPrefix ? buildTextPreOrSuffix('Prefix Text widget') : null,
      suffix:
          state.showSuffix ? buildTextPreOrSuffix('Suffix Text widget') : null,
      prefixIcon: state.showPrefixIcon ? const Icon(Icons.phone) : null,
      border: hasBorder ? const OutlineInputBorder() : null,
    ));
  }
}
