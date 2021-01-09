import 'package:flutter/material.dart';
import 'package:seventh_main/screens/hospitals/hospital_appointment/hospital_appointment.dart';
import 'package:seventh_main/util/themes/app_colors.dart';
import 'package:seventh_main/widgets/custom_button.dart';
import '../../../util/extensions/size_extendion.dart';

class HospitalDetailScreen extends StatelessWidget {
  final String title;
  final String serviceType1;
  final String serviceType2;
  final String open;
  final String email;
  final String contact;
  final String facebook;
  final String instagram;
  final String country;
  final String city;
  final String sub;
  final String description;
  const HospitalDetailScreen({
    Key key,
    @required this.title,
    @required this.serviceType1,
    @required this.serviceType2,
    @required this.open,
    @required this.email,
    @required this.contact,
    @required this.facebook,
    @required this.instagram,
    @required this.country,
    @required this.city,
    @required this.sub,
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
        padding: const EdgeInsets.only(
          left: 25.0,
          right: 25.0,
        ),
        child: ListView(
          children: [
            Image.asset(
              'assets/95732720-a-vector-cartoon-representing-a-funny-hospital-building-with-a-rescue-helicopter-on-its-roof-an-ambu.jpg',
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
                    3.verticalSpace,
                    Text(
                      'Sercices = $serviceType1 & $serviceType2',
                      style: textStyle,
                    ),
                    3.verticalSpace,
                    Text(
                      'Service Provided= $open',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ),
            10.verticalSpace,
            Container(
              width: 375,
              height: 150,
              decoration: BoxDecoration(
                color: AppColors.grayTwo,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    2.verticalSpace,
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
                    3.verticalSpace,
                    Text(
                      'Phone = $contact',
                      style: textStyle,
                    ),
                    3.verticalSpace,
                    Text(
                      'Facebook= $facebook',
                      style: textStyle,
                    ),
                    3.verticalSpace,
                    Text(
                      'Instagram= $instagram',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ),
            10.verticalSpace,
            Container(
              width: 375,
              height: 125,
              decoration: BoxDecoration(
                color: AppColors.grayTwo,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    2.verticalSpace,
                    Center(
                      child: Text(
                        'Location',
                        style: textStyle,
                      ),
                    ),
                    5.verticalSpace,
                    Text(
                      'Country = $country',
                      style: textStyle,
                    ),
                    3.verticalSpace,
                    Text(
                      'City = $city',
                      style: textStyle,
                    ),
                    3.verticalSpace,
                    Text(
                      'Street = $sub',
                      style: textStyle,
                    ),
                  ],
                ),
              ),
            ),
            10.verticalSpace,
            Container(
              width: 375,
              height: 95,
              decoration: BoxDecoration(
                color: AppColors.grayTwo,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    2.verticalSpace,
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
                    builder: (context) => HosptalAppointmentScreen(
                      name: title,
                    ),
                  ),
                );
              },
            ),
            20.verticalSpace,
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
