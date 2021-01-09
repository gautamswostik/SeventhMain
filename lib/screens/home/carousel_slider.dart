import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:seventh_main/util/constants/size_constant.dart';
import '../../util/extensions/size_extendion.dart';

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final List<String> imgList = [
    "assets/cs-tips-for-better-digestive-health-722x406.jpg",
    "assets/Health-Tip-EAT-MORE-SLOWLY.jpg",
    "assets/Mental-Heath-Quote-2.jpg",
    "assets/tips-for-healthy-heart-thumb.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_500.flexibleWidth,
      height: Sizes.dimen_200.flexibleWidth,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          height: Sizes.dimen_300.flexibleHeight,
        ),
        items: getSlider(imgList),
      ),
    );
  }

  getSlider(List imgList) {
    return imgList
        .map(
          (images) => Container(
            padding: EdgeInsets.only(
              left: 3.0,
              right: 5.0,
              top: 10.0,
              bottom: 10.0,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9.0)),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(images),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        .toList();
  }
}
