import 'package:flutter/material.dart';

class SettingRow extends StatefulWidget {
  const SettingRow({
    super.key,
    this.title,
    this.isSwitch = false,
    this.dropdownHint = 'Select an option',
    this.currentValue,
    this.valueList = const [],
    this.onChanged,
  });

  final String? title;
  final bool isSwitch;
  final String dropdownHint;
  final dynamic currentValue;
  final List<MapEntry<String, dynamic>> valueList;
  final Function(dynamic)? onChanged;

  @override
  State<SettingRow> createState() => _SettingRowState();
}

class _SettingRowState extends State<SettingRow> {
  late dynamic _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.currentValue;
  }

  void onUserSelectValue(dynamic value) {
    setState(() {
      _currentValue = value;
    });
    widget.onChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (widget.title != null) Text(widget.title!),
        if (widget.isSwitch)
          Switch(
            value: _currentValue,
            onChanged: onUserSelectValue,
          )
        else
          DropdownButton(
            value: _currentValue,
            onChanged: onUserSelectValue,
            hint: Text(widget.dropdownHint),
            items: widget.valueList.map((value) {
              return DropdownMenuItem(
                value: value.value,
                child: Text(value.key),
              );
            }).toList(),
          ),
      ],
    );
  }
}
