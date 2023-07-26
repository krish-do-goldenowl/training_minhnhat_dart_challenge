import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/container_decoration/widgets/setting_view.dart';

class ContainerDecorationView extends StatefulWidget {
  const ContainerDecorationView({super.key});

  @override
  State<ContainerDecorationView> createState() =>
      _ContainerDecorationViewState();
}

class _ContainerDecorationViewState extends State<ContainerDecorationView> {
  var border = false;
  var borderRadius = 0.0;
  var boxShadow = false;
  var background = Colors.blue;
  var backgroundBlendMode = BlendMode.src;

  void onSettingChanged(dynamic newValue, int index) {
    switch (index) {
      case 0:
        setState(() {
          border = newValue;
        });
        break;
      case 1:
        setState(() {
          borderRadius = newValue;
        });
        break;
      case 2:
        setState(() {
          boxShadow = newValue;
        });
        break;
      case 3:
        setState(() {
          background = newValue;
        });
        break;
      case 4:
        setState(() {
          backgroundBlendMode = newValue;
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container View'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SettingView(
          onSettingChanged: onSettingChanged,
          border: border,
          borderRadius: borderRadius,
          boxShadow: boxShadow,
          background: background,
          backgroundBlendMode: backgroundBlendMode,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 50.0,
        ),
        decoration: BoxDecoration(
          border: border
              ? Border.all(
                  color: Colors.black,
                  width: 2.0,
                )
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: boxShadow
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10.0,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
          backgroundBlendMode: backgroundBlendMode,
          color: background,
        ),
      ),
    );
  }
}
