import 'package:flutter/material.dart';
import 'package:gallery_widgets/features/home/widgets/list_item_widget.dart';
import 'package:gallery_widgets/models/home/list_data.dart';

class ListWidgets extends StatefulWidget {
  const ListWidgets({super.key});

  @override
  State<ListWidgets> createState() => _ListWidgetsState();
}

class _ListWidgetsState extends State<ListWidgets> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _scrollController,
      child: ListView.builder(
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: listWidgetsData.length,
        itemBuilder: (context, index) {
          return ListItemWidget(data: listWidgetsData[index]);
        },
      ),
    );
  }
}
