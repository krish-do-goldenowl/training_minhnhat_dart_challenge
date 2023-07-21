import 'package:flutter/cupertino.dart';

class CupertinoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CupertinoAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100.0),
      child: Container(
        alignment: Alignment.bottomLeft,
        height: 87,
        child: CupertinoNavigationBar(
          border: const Border(
            bottom: BorderSide(
              color: Color.fromARGB(77, 154, 154, 154),
              width: 0.0, // 0.0 means one physical pixel
            ),
          ),
          leading: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(CupertinoIcons.left_chevron),
              ),
              Expanded(
                child: Transform.scale(
                  scaleY: 1.2,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
