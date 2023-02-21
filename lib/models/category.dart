import 'package:flutter/material.dart';

class category {
  final String id;
  final String title;
  final Color color;

  category({
    required this.id,
    this.color = Colors.orange,
    required this.title,
  });
}
