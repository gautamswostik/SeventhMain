import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:seventh_main/data/core/api_constants.dart';
import 'package:seventh_main/data/core/urls.dart';
import 'package:seventh_main/data/models/doctor_appointment_model/doc_appointment.dart';
import 'package:seventh_main/domain/entities/doc_appointment_entity.dart';
import 'package:seventh_main/util/themes/app_colors.dart';
import 'package:mailer/mailer.dart';
import 'package:http/http.dart' as http;
import 'package:mailer/smtp_server.dart';
import '../../util/extensions/size_extendion.dart';

class DoctorAppointmentListScreen extends StatefulWidget {
  final List<DoctorAppointmentEntity> docApointment;

  const DoctorAppointmentListScreen({
    Key key,
    @required this.docApointment,
  }) : super(key: key);

  @override
  _DoctorAppointmentListScreenState createState() =>
      _DoctorAppointmentListScreenState();
}

class _DoctorAppointmentListScreenState
    extends State<DoctorAppointmentListScreen> {
  sendMail(String mymail, String name, String forDoc, String time) async {
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
          "<h1>Hello $name</h1>\n<p>Your appointment for Dr. $forDoc has been accepted!! hope to see you in your specified time $time</p>";

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
        title: Text('Appointment for Doctors'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 15.0,
          right: 25.0,
          left: 25.0,
        ),
        child: ListView.builder(
          itemCount: widget.docApointment.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: 375,
                  height: 300,
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
                          'For = ${widget.docApointment[index].forDoctor}',
                          style: textStyle,
                        ),
                        2.verticalSpace,
                        Text(
                          'Full Name = ${widget.docApointment[index].fullName}',
                          style: textStyle,
                        ),
                        2.verticalSpace,
                        Text(
                          'Email = ${widget.docApointment[index].email}',
                          style: textStyle,
                        ),
                        2.verticalSpace,
                        Text(
                          'Contact = ${widget.docApointment[index].contact}',
                          style: textStyle,
                        ),
                        2.verticalSpace,
                        Text(
                          'Time = ${widget.docApointment[index].date}',
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
                          widget.docApointment[index].problemDescription,
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
                                      widget.docApointment[index].email;
                                  final String name =
                                      widget.docApointment[index].fullName;
                                  final String forDoc =
                                      widget.docApointment[index].forDoctor;
                                  final String time =
                                      widget.docApointment[index].date;
                                  sendMail(email, name, forDoc, time);
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
                                      widget.docApointment[index].id;
                                  deleteDocAppointment(id);
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

Future<DoctorAppointmentEntity> deleteDocAppointment(String id) async {
  final http.Response response = await http.delete(
    '$doctorAppointmentEndpoint/$id',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    return DoctorAppointment.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to delete Appointment.');
  }
}

final TextStyle textStyle = TextStyle(
  fontStyle: FontStyle.italic,
  fontSize: 16.flexibleFontSize,
  fontWeight: FontWeight.bold,
);
