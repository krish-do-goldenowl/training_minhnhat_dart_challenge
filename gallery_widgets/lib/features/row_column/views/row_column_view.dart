import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/row_column/widgets/setting_view.dart';

class RowColumnView extends StatefulWidget {
  const RowColumnView({super.key});

  @override
  State<RowColumnView> createState() => _RowColumnViewState();
}

class _RowColumnViewState extends State<RowColumnView> {
  var isRow = true;
  var mainAxisAlignment = MainAxisAlignment.start;
  var mainAxisSize = MainAxisSize.max;
  var crossAxisAlignment = CrossAxisAlignment.center;
  var verticalDirection = VerticalDirection.down;
  var textDirection = TextDirection.ltr;
  var textBaseline = TextBaseline.alphabetic;

  void onSettingChanged(dynamic newValue, int index) {
    switch (index) {
      case 0:
        setState(() {
          isRow = newValue;
        });
        break;
      case 1:
        setState(() {
          mainAxisSize = newValue;
        });
        break;
      case 2:
        setState(() {
          mainAxisAlignment = newValue;
        });
        break;
      case 3:
        setState(() {
          crossAxisAlignment = newValue;
        });
        break;
      case 4:
        setState(() {
          verticalDirection = newValue;
        });
        break;
      case 5:
        setState(() {
          textDirection = newValue;
        });
        break;
      case 6:
        setState(() {
          textBaseline = newValue;
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row & Column'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SettingView(
          isRow: isRow,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          verticalDirection: verticalDirection,
          textDirection: textDirection,
          textBaseline: textBaseline,
          onSettingChanged: onSettingChanged,
        ),
      ),
      body: Container(
        color: Colors.yellowAccent,
        child: isRow ? _buildRow() : _buildColumn(),
      ),
    );
  }

  List<Widget> getChildren() {
    return const [
      Icon(Icons.brightness_auto, size: 25),
      Icon(Icons.brightness_auto, size: 50),
      Icon(Icons.brightness_auto, size: 25),
    ];
  }

  Widget _buildRow() {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      textBaseline: textBaseline,
      children: getChildren(),
    );
  }

  Widget _buildColumn() {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      textBaseline: textBaseline,
      children: getChildren(),
    );
  }
}
