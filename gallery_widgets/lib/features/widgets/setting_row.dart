import 'package:flutter/material.dart';

enum SettingType {
  switcher,
  dropdown,
  radio,
}

class SettingRow extends StatefulWidget {
  const SettingRow({
    super.key,
    this.title = '',
    this.settingType = SettingType.dropdown,
    this.dropdownHint = 'Select an option',
    this.currentValue,
    this.radioGroupValue,
    this.valueList = const [],
    this.onChanged,
  });

  final String title;
  final SettingType settingType;
  final String dropdownHint;
  final dynamic currentValue;
  final dynamic radioGroupValue;
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
    if (widget.settingType == SettingType.radio) {
      return _buildRadio();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (widget.title.isNotEmpty) Text(widget.title),
        if (widget.settingType == SettingType.switcher)
          _buildSwitcher()
        else if (widget.settingType == SettingType.dropdown)
          _buildDropdown(),
      ],
    );
  }

  Widget _buildSwitcher() {
    return Switch(
      value: _currentValue,
      onChanged: onUserSelectValue,
    );
  }

  Widget _buildDropdown() {
    return DropdownButton(
      value: _currentValue,
      onChanged: onUserSelectValue,
      hint: Text(widget.dropdownHint),
      items: widget.valueList.map((value) {
        return DropdownMenuItem(
          value: value.value,
          child: Text(value.key),
        );
      }).toList(),
    );
  }

  Widget _buildRadio() {
    return RadioListTile(
      value: _currentValue,
      groupValue: widget.radioGroupValue,
      title: Text(widget.title),
      onChanged: onUserSelectValue,
    );
  }
}
