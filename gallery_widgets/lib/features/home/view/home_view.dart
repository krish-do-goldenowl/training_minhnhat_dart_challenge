import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/home/widgets/custom_app_bar.dart';
import 'package:gallery_widgets/features/home/widgets/list_widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: Drawer(),
      appBar: CustomAppBar(height: 100),
      body: ListWidgets(),
    );
  }
}
