import 'package:flutter/material.dart';

class ButtonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ButtonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Button View'),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.cyanAccent,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.close_rounded,
            color: Colors.red,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
