import 'package:flutter/material.dart';

class Classes {
  final String id;
  final Color color;
  final String title;

  const Classes({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
}
