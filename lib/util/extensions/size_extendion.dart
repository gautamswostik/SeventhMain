import 'package:flutter/material.dart';
import 'package:seventh_main/util/screenutil/screenutil.dart';

extension SizeExtension on num {
  // use for all static height throughout the entire app
  num get flexibleHeight => ScreenUtil().setHeight(this);
  // use for all static width throughout the entire app
  num get flexibleWidth => ScreenUtil().setWidth(this);
  // use for all font size throughout the entire app
  num get flexibleFontSize => ScreenUtil().setSp(this);

  /// Use to add horizontal space
  SizedBox get horizontalSpace => SizedBox(width: flexibleWidth);
  // Use to add vertical space
  SizedBox get verticalSpace => SizedBox(height: flexibleHeight);
}
