import 'package:flutter/material.dart';

class DropdownDropdownForm extends StatefulWidget {
  const DropdownDropdownForm({super.key});

  @override
  State<DropdownDropdownForm> createState() => _DropdownDropdownFormState();
}

class _DropdownDropdownFormState extends State<DropdownDropdownForm> {
  int? dropdownValue;
  String? dropdownFormValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDropdownWidget(),
        buildDropdownFormWidget(),
      ],
    );
  }

  Widget buildDropdownWidget() {
    return DropdownButton<int?>(
      value: dropdownValue,
      onChanged: (newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      hint: const Text('Dropdown'),
      items: const [
        DropdownMenuItem(
          value: 1,
          child: Text('1'),
        ),
        DropdownMenuItem(
          value: 2,
          child: Text('2'),
        ),
        DropdownMenuItem(
          value: 3,
          child: Text('3'),
        ),
      ],
    );
  }

  Widget buildDropdownFormWidget() {
    return DropdownButtonFormField<String?>(
      value: dropdownFormValue,
      onChanged: (newValue) {
        setState(() {
          dropdownFormValue = newValue;
        });
      },
      hint: const Text('Dropdown Form Field'),
      validator: (newValue) {
        if (newValue == '1') {
          return '1 is available but not a valid input.';
        }
        return null;
      },
      items: const [
        DropdownMenuItem(
          value: '1',
          child: Text('1'),
        ),
        DropdownMenuItem(
          value: '2',
          child: Text('2'),
        ),
        DropdownMenuItem(
          value: '3',
          child: Text('3'),
        ),
      ],
    );
  }
}
