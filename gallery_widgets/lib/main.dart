import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/home/view/home_screen.dart';
import 'package:gallery_widgets/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      home: HomeScreen(),
    );
  }
}
