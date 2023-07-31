import 'package:flutter/material.dart';

enum SettingType {
  switcher,
  dropdown,
  radio,
}

class SettingRow<T> extends StatefulWidget {
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
  final T? currentValue;
  final T? radioGroupValue;
  final List<MapEntry<String, T?>> valueList;
  final void Function(T?)? onChanged;

  @override
  State<SettingRow> createState() => _SettingRowState<T>();
}

class _SettingRowState<T> extends State<SettingRow<T>> {
  late T? _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.currentValue;
  }

  void onUserSelectValue(T? value) {
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
        if (widget.settingType == SettingType.switcher && _currentValue is bool)
          _buildSwitcher()
        else if (widget.settingType == SettingType.dropdown)
          _buildDropdown(),
      ],
    );
  }

  Widget _buildSwitcher() {
    return Switch(
      value: (_currentValue as bool?) ?? false,
      onChanged: (value) {
        if (_currentValue is bool) {
          onUserSelectValue(value as T);
        }
      },
    );
  }

  Widget _buildDropdown() {
    return DropdownButton<T?>(
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
    return RadioListTile<T?>(
      value: _currentValue,
      groupValue: widget.radioGroupValue,
      title: Text(widget.title),
      onChanged: onUserSelectValue,
    );
  }
}
