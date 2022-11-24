

// Flutter imports:
import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get midValue => height * 0.03;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMid => EdgeInsets.all(midValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: highValue);
}

extension PaddingExtensionOnly on BuildContext {
  EdgeInsets get paddingLowBottom =>
      EdgeInsets.only(bottom: lowValue);
  EdgeInsets get paddingNormalBottom =>
      EdgeInsets.only(bottom: normalValue);
  EdgeInsets get paddingMediumBottom =>
      EdgeInsets.only(bottom: mediumValue);
  EdgeInsets get paddingNormalRight =>
      EdgeInsets.only(right: normalValue);
  EdgeInsets get paddingNormalTop =>
      EdgeInsets.only(top: normalValue);
  EdgeInsets get paddingLowTop =>
      EdgeInsets.only(top: lowValue);
  EdgeInsets get paddingMediumLeft =>
      EdgeInsets.only(left: mediumValue);
  EdgeInsets get paddingNormalLeft =>
      EdgeInsets.only(left: normalValue);
  EdgeInsets get paddingLowLeft =>
      EdgeInsets.only(left: lowValue);
  EdgeInsets get paddingLowRight =>
      EdgeInsets.only(right: lowValue);
}
extension PaddingWithOutOnly on BuildContext {
  EdgeInsets get paddingNormalWithOutBottom =>
      EdgeInsets.only(right: normalValue,left: normalValue,top: normalValue);
}

extension RadiusCircular on BuildContext {
  Radius get normalRadiusCircular => Radius.circular(normalValue);
  Radius get lowRadiusCircular => Radius.circular(lowValue);
  Radius get mediumRadiusCircular => Radius.circular(mediumValue);
}

extension BorderRadiusExtension on BuildContext {
  BorderRadius get borderNormalTopLeftRight => BorderRadius.only(
      topLeft: normalRadiusCircular, topRight: normalRadiusCircular);
  BorderRadius get borderMediumTopLeftRight => BorderRadius.only(
      topLeft: mediumRadiusCircular, topRight: mediumRadiusCircular);
  BorderRadius get borderNormalAll => BorderRadius.all(normalRadiusCircular);
  BorderRadius get borderLowAll => BorderRadius.all(lowRadiusCircular);
}

extension PageExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension DurationExtension on BuildContext {
  Duration get veryLowDuration => const Duration(milliseconds: 200);
  Duration get lowDuration => const Duration(milliseconds: 500);
  Duration get normalDuration => const Duration(seconds: 1);
}
