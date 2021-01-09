import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seventh_main/data/core/api_constants.dart';
import 'package:seventh_main/data/core/urls.dart';
import 'package:seventh_main/data/models/hospital_appointment/hospital_appoitment.dart';
import 'package:seventh_main/domain/entities/hos_appointment_entity.dart';
import 'package:seventh_main/util/themes/app_colors.dart';
import 'package:mailer/mailer.dart';
import 'package:http/http.dart' as http;
import 'package:mailer/smtp_server.dart';
import '../../util/extensions/size_extendion.dart';

class HospitalAppointmentScreen extends StatefulWidget {
  final List<HospitalAppointmentEntity> hosApointment;

  const HospitalAppointmentScreen({
    Key key,
    @required this.hosApointment,
  }) : super(key: key);

  @override
  _HospitalAppointmentScreenState createState() =>
      _HospitalAppointmentScreenState();
}

class _HospitalAppointmentScreenState extends State<HospitalAppointmentScreen> {
  sendMail(String mymail, String name, String forHos, String time) async {
    String username = ApiConstants.EMAIL_ADDRESS;
    String password = ApiConstants.PASSOWRD;

    final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(username, 'Seventh Project')
      ..recipients.add(mymail)
      ..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
      ..bccRecipients.add(Address('bccAddress@example.com'))
      ..subject = 'Your appointment has been Accepted'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          "<h1>Hello $name</h1>\n<p>Your appointment for Hospital $forHos has been accepted!! hope to see you in your specified time $time.</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Appointment for Hospital'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15.0,
          right: 25.0,
          left: 25.0,
        ),
        child: ListView.builder(
          itemCount: widget.hosApointment.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: 375,
                  height: 285,
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
                        Text(
                          'For = ${widget.hosApointment[index].forHospital}',
                          style: textStyle,
                        ),
                        2.verticalSpace,
                        Text(
                          'Full Name = ${widget.hosApointment[index].fullName}',
                          style: textStyle,
                        ),
                        2.verticalSpace,
                        Text(
                          'Email = ${widget.hosApointment[index].email}',
                          style: textStyle,
                        ),
                        2.verticalSpace,
                        Text(
                          'Contact = ${widget.hosApointment[index].contact}',
                          style: textStyle,
                        ),
                        2.verticalSpace,
                        Text(
                          'Time = ${widget.hosApointment[index].date}',
                          style: textStyle,
                        ),
                        2.verticalSpace,
                        Text(
                          'Problem Catagory = ${widget.hosApointment[index].problemCatagory}',
                          maxLines: 3,
                          style: textStyle,
                        ),
                        2.verticalSpace,
                        Text(
                          'Problem Description =',
                          maxLines: 3,
                          style: textStyle,
                        ),
                        2.verticalSpace,
                        Text(
                          widget.hosApointment[index].problemDescription,
                          maxLines: 3,
                          style: textStyle,
                        ),
                        10.verticalSpace,
                        Builder(
                          builder: (context) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RaisedButton(
                                child: Text(
                                  'Accept',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                color: Colors.green,
                                onPressed: () {
                                  final String email =
                                      widget.hosApointment[index].email;
                                  final String name =
                                      widget.hosApointment[index].fullName;
                                  final String forHos =
                                      widget.hosApointment[index].forHospital;
                                  final String time =
                                      widget.hosApointment[index].date;

                                  sendMail(email, name, forHos, time);
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: AppColors.royalBlue,
                                      content: Text('Accepted an Appointment'),
                                    ),
                                  );
                                },
                              ),
                              RaisedButton(
                                child: Text(
                                  'Reject',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                color: Colors.red,
                                onPressed: () {
                                  final String id =
                                      widget.hosApointment[index].id;
                                  deleteHosAppointment(id);
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text('Rejected an Appointment'),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                15.verticalSpace,
              ],
            );
          },
        ),
      ),
    );
  }
}

Future<HospitalAppointmentEntity> deleteHosAppointment(String id) async {
  final http.Response response = await http.delete(
    '$hospitalAppointmenrEndpoint/$id',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    return HospitalAppointment.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete Appointment.');
  }
}

final TextStyle textStyle = TextStyle(
  fontStyle: FontStyle.italic,
  fontSize: 16.flexibleFontSize,
  fontWeight: FontWeight.bold,
);
