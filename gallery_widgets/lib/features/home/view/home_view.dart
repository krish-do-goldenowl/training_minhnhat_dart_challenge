import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/home/widgets/list_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My widgets'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.account_circle_rounded,
            ),
          ),
        ],
      ),
      body: const ListWidgets(),
    );
  }
}
