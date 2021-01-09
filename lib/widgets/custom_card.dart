import 'package:flutter/material.dart';
import '../util/extensions/size_extendion.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;
  final String imgUrl;

  const CustomCard({
    Key key,
    @required this.title,
    @required this.onTap,
    @required this.imgUrl,
    this.subtitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 375.flexibleWidth,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imgUrl,
              fit: BoxFit.fill,
            ),
            ListTile(
              title: Text(
                title,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: Text(subtitle == null ? '' : subtitle),
            ),
          ],
        ),
      ),
    );
  }
}
