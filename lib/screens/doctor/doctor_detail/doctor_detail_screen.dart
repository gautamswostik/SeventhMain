import 'package:flutter/material.dart';
import 'package:seventh_main/screens/doctor/dorcor_appointment/doc_appontment.dart';
import 'package:seventh_main/util/constants/size_constant.dart';
import 'package:seventh_main/util/themes/app_colors.dart';
import 'package:seventh_main/widgets/custom_button.dart';
import '../../../util/extensions/size_extendion.dart';

class DoctorDetailScreen extends StatelessWidget {
  final String title;
  final String type;
  final String work;
  final String email;
  final String instagram;
  final String description;

  const DoctorDetailScreen({
    Key key,
    @required this.title,
    @required this.type,
    @required this.work,
    @required this.email,
    @required this.instagram,
    @required this.description,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 25.0,
          right: 25.0,
        ),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                  width: Sizes.dimen_300.flexibleWidth,
                  height: Sizes.dimen_300,
                  child: Image.asset(
                      'assets/cartoon-doctor-little-girl-character-simple-cute-funny-illustration-106630241.jpg')),
            ),
            10.verticalSpace,
            Container(
              width: 375,
              height: 105,
              decoration: BoxDecoration(
                color: AppColors.grayTwo,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    5.verticalSpace,
                    Text(
                      'Name = $title',
                      style: textStyle,
                    ),
                    2.verticalSpace,
                    Text(
                      'Type = $type',
                      style: textStyle,
                    ),
                    2.verticalSpace,
                    Text(
                      'Working on = $work',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ),
            10.verticalSpace,
            Container(
              width: 375,
              height: 130,
              decoration: BoxDecoration(
                color: AppColors.grayTwo,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    5.verticalSpace,
                    Center(
                      child: Text(
                        'Contacts',
                        style: textStyle,
                      ),
                    ),
                    5.verticalSpace,
                    Text(
                      'E-mail = $email',
                      style: textStyle,
                    ),
                    2.verticalSpace,
                    Text(
                      'Facebook = facebook',
                      style: textStyle,
                    ),
                    2.verticalSpace,
                    Text(
                      'Instagram = $instagram',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ),
            10.verticalSpace,
            Container(
              width: 375,
              height: 135,
              decoration: BoxDecoration(
                color: AppColors.grayTwo,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    5.verticalSpace,
                    Center(
                      child: Text(
                        'Description',
                        style: textStyle,
                      ),
                    ),
                    5.verticalSpace,
                    Text(
                      description,
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ),
            10.verticalSpace,
            CustomButton(
              buttonName: 'Appointment',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocAppointment(
                      name: title,
                    ),
                  ),
                );
              },
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}

final TextStyle textStyle = TextStyle(
  fontStyle: FontStyle.italic,
  fontSize: 16.flexibleFontSize,
  fontWeight: FontWeight.bold,
);
