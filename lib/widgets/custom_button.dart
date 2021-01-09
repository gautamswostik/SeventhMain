import 'package:flutter/material.dart';
import 'package:seventh_main/util/themes/app_colors.dart';
import '../util/extensions/size_extendion.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String buttonName;
  const CustomButton({
    Key key,
    @required this.buttonName,
    @required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.flexibleHeight,
      width: 370.flexibleWidth,
      child: RaisedButton(
        color: AppColors.detailcolor,
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 18.flexibleFontSize,
            color: AppColors.unselectedTabColor,
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
