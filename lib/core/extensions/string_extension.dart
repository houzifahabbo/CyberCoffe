import 'package:flutter/material.dart';

extension ColorPaletteExtension on String {
  int? get colorCode => int.tryParse('0xFF$this');
  Color get colorPalette => Color(colorCode ?? 0xFFFFFFFF);
}