import 'package:flutter/material.dart';
import 'package:gallery_widgets/models/home/gallery_item_model.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({super.key, required this.data});

  final GalleryItemModel data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(data.icon),
      title: Text(data.title),
      subtitle: Text(data.subtitle),
      onTap: () {
        Navigator.pushNamed(context, data.desRoute);
      },
    );
  }
}
