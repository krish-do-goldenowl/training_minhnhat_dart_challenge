import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/image_title_app_bar/widgets/custom_sliver_app_bar_delegate.dart';

class ImageTitleAppBarView extends StatelessWidget {
  const ImageTitleAppBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: CustomAppBarDelegate(expandedHeight: 200),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, index) => ListTile(
                  title: Text("Index: $index"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
