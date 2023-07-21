import 'package:flutter/material.dart';
import 'package:gallery_widgets/models/home/gallery_item_model.dart';
import 'package:gallery_widgets/router/route_names.dart';

const listWidgetsData = [
  GalleryItemModel(
    title: 'Cupertino',
    subtitle:
        'Beautiful and high-fidelity widgets for current iOS design language',
    desRoute: RouteNames.cupertino,
    icon: Icons.phone_iphone_rounded,
  ),
  GalleryItemModel(
    title: 'Typography',
    subtitle: 'All of the predefined text styles',
    desRoute: RouteNames.typography,
    icon: Icons.text_fields_rounded,
  ),
  GalleryItemModel(
    title: 'Bottom app bar',
    subtitle: 'Bottom application bar',
    desRoute: RouteNames.bottomAppBar,
    icon: Icons.menu_rounded,
  ),
  GalleryItemModel(
    title: 'Button',
    subtitle:
        'RaisedButton, FlatButton, DropdownButton, FloatingActionButton, IconButton, InkWell, RawMaterialButton, etc',
    desRoute: RouteNames.button,
    icon: Icons.web_outlined,
  ),
  GalleryItemModel(
    title: 'List',
    subtitle: 'Scrolling list layout',
    desRoute: RouteNames.list,
    icon: Icons.format_list_bulleted_rounded,
  ),
  GalleryItemModel(
    title: 'Card',
    subtitle: 'Cards with rounded corners and decoration',
    desRoute: RouteNames.card,
    icon: Icons.chrome_reader_mode_rounded,
  ),
  GalleryItemModel(
    title: 'Alert',
    subtitle: 'Alerts, SnackBar & Tooltip',
    desRoute: RouteNames.alert,
    icon: Icons.tab_unselected_rounded,
  ),
  GalleryItemModel(
    title: 'Text Field',
    subtitle: 'Text Field, Text Field Form',
    desRoute: RouteNames.textField,
    icon: Icons.dehaze_rounded,
  ),
  GalleryItemModel(
    title: 'Row & Column',
    subtitle:
        'A widget that displays its children in a horizontal and vertical array',
    desRoute: RouteNames.rowAndColumn,
    icon: Icons.graphic_eq_rounded,
  ),
  GalleryItemModel(
    title: 'Wrap & Chip',
    subtitle: 'Wrap & Chip',
    desRoute: RouteNames.wrapAndChip,
    icon: Icons.edit_attributes_rounded,
  ),
  GalleryItemModel(
    title: 'Stack & Align',
    subtitle:
        'BA widget that positions its children relative to the edges of its box',
    desRoute: RouteNames.stackAndAlign,
    icon: Icons.copy_outlined,
  ),
];
