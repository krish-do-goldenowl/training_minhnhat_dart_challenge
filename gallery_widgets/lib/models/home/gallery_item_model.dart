import 'package:flutter/material.dart';

class GalleryItemModel {
  const GalleryItemModel({
    required this.title,
    required this.subtitle,
    required this.desRoute,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final String desRoute;
  final IconData icon;
}
