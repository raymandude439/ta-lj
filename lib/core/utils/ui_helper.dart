import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  UIHelper._();

  static double setHeight(double height) {
    return ScreenUtil().setHeight(height);
  }

  static double setSp(double size) {
    return size.sp;
  }

  static double setWidth(double width) {
    return ScreenUtil().setWidth(width);
  }

  static double statusBarHeight(BuildContext context) =>
      MediaQuery.of(context).viewPadding.top;

  static EdgeInsetsGeometry padSymmetric(
      {double? horizontal,
        double? vertical,
        double? cwTop,
        double? cwBottom,
        double? cwLeft,
        double? cwRight}) {
    return EdgeInsets.symmetric(
        vertical: UIHelper.setHeight(vertical ?? 0),
        horizontal: UIHelper.setWidth(horizontal ?? 0))
        .copyWith(
        top: cwTop ?? UIHelper.setHeight(vertical ?? 0),
        bottom: cwBottom ?? UIHelper.setHeight(vertical ?? 0),
        right: cwRight ?? UIHelper.setWidth(horizontal ?? 0),
        left: cwLeft ?? UIHelper.setWidth(horizontal ?? 0));
  }

  static EdgeInsetsGeometry padAll(double size,
      {double? cwTop, double? cwBottom, double? cwLeft, double? cwRight}) {
    return EdgeInsets.all(UIHelper.setHeight(size)).copyWith(
        top: cwTop ?? UIHelper.setHeight(size),
        bottom: cwBottom ?? UIHelper.setHeight(size),
        right: cwRight ?? UIHelper.setHeight(size),
        left: cwLeft ?? UIHelper.setHeight(size));
  }

  static EdgeInsetsGeometry padLTRB(
      double left, double top, double right, double bottom,
      {double? cwTop, double? cwBottom, double? cwLeft, double? cwRight}) {
    return EdgeInsets.fromLTRB(UIHelper.setWidth(left), UIHelper.setHeight(top),
        UIHelper.setWidth(right), UIHelper.setHeight(bottom))
        .copyWith(
        top: cwTop ?? UIHelper.setHeight(top),
        bottom: cwBottom ?? UIHelper.setHeight(bottom),
        right: cwRight ?? UIHelper.setWidth(right),
        left: cwLeft ?? UIHelper.setWidth(left));
  }

  static DeviceType getCurrentDeviceType(BuildContext context) {
    final currentOrientation = MediaQuery.orientationOf(context);
    final currentScreenWidth = MediaQuery.sizeOf(context).width;
    final currentScreenHeight = MediaQuery.sizeOf(context).height;
    if (Platform.isAndroid || Platform.isIOS) {
      if ((currentOrientation == Orientation.portrait &&
          currentScreenWidth < 600) ||
          (currentOrientation == Orientation.landscape &&
              currentScreenHeight < 600)) {
        return DeviceType.mobile;
      } else {
        return DeviceType.tablet;
      }
    } else {
      return DeviceType.web;
    }
  }

  static double setFont(double font) {
    return ScreenUtil().setSp(font);
  }

  static double mediaHeight(BuildContext context, double scale) {
    return MediaQuery.of(context).size.height * scale;
  }

  static Size size(BuildContext context) => MediaQuery.of(context).size;

  static Size appBarSize(BuildContext context) =>
      Size(size(context).width, 55.0 + statusBarHeight(context));

  static double mediaWidth(BuildContext context, double scale) {
    return MediaQuery.of(context).size.width * scale;
  }

  static Widget verticalSpace(double height) {
    return SizedBox(height: setHeight(height));
  }

  static Widget horizontalSpace(double width) {
    return SizedBox(width: setWidth(width));
  }
}
