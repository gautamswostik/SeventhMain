import 'dart:convert';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:eva_icons_flutter/icon_data.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:seventh_main/data/models/doctor_appointment_model/doc_appointment.dart';
import 'package:flutter/material.dart';
import 'package:seventh_main/data/core/urls.dart';
import 'package:seventh_main/util/themes/app_colors.dart';
import 'package:seventh_main/widgets/custom_button.dart';
import '../../../util/extensions/size_extendion.dart';
import 'package:http/http.dart' as http;

class DocAppointment extends StatefulWidget {
  final String name;

  const DocAppointment({
    Key key,
    @required this.name,
  }) : super(key: key);
  @override
  _DocAppointmentState createState() => _DocAppointmentState();
}

class _DocAppointmentState extends State<DocAppointment> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final contactController = TextEditingController();
  final problemController = TextEditingController();
  final monthSelectedController = TextEditingController();
  final daySelectingController = TextEditingController();
  final timeController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validate() {
    if (_formKey.currentState.validate()) {
      print('validated');
    } else {
      print('not validated');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Create an Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 18.0,
          left: 25.0,
          right: 25.0,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Your Time',
                style: style,
                textAlign: TextAlign.left,
              ),
              5.verticalSpace,
              DropDownField(
                controller: monthSelectedController,
                hintText: 'Select Month',
                enabled: true,
                items: _months,
              ),
              5.verticalSpace,
              DropDownField(
                controller: daySelectingController,
                hintText: 'Select Day',
                enabled: true,
                items: daysString,
              ),
              5.verticalSpace,
              DropDownField(
                controller: timeController,
                hintText: 'Select Time',
                enabled: true,
                items: _times,
              ),
              10.verticalSpace,
              Text(
                'Full Name',
                style: style,
                textAlign: TextAlign.left,
              ),
              5.verticalSpace,
              TextFormField(
                controller: nameController,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Name is required.'),
                  MinLengthValidator(8,
                      errorText: 'The name must contain at least 8 characters.')
                ]),
                decoration: InputDecoration(
                  hintText: 'eg , Alex Jhones',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(),
                  ),
                  fillColor: AppColors.backgroundColor,
                ),
              ),
              10.verticalSpace,
              Text(
                'Email',
                style: style,
                textAlign: TextAlign.left,
              ),
              5.verticalSpace,
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Email is required.'),
                  EmailValidator(errorText: 'Not a valid email.')
                ]),
                decoration: InputDecoration(
                  hintText: 'eg , alex@gmail.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(),
                  ),
                  fillColor: AppColors.backgroundColor,
                ),
              ),
              10.verticalSpace,
              Text(
                'Contact',
                style: style,
                textAlign: TextAlign.left,
              ),
              5.verticalSpace,
              TextFormField(
                controller: contactController,
                keyboardType: TextInputType.number,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Contact is required'),
                  MinLengthValidator(8,
                      errorText: 'Please enter valid contact'),
                ]),
                decoration: InputDecoration(
                  hintText: 'eg , +977 0102030405',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(),
                  ),
                  fillColor: AppColors.backgroundColor,
                ),
              ),
              10.verticalSpace,
              Text(
                'Problem Description',
                style: style,
                textAlign: TextAlign.left,
              ),
              5.verticalSpace,
              TextFormField(
                controller: problemController,
                validator: MultiValidator([
                  RequiredValidator(
                      errorText: 'Problem description is required'),
                  MinLengthValidator(10,
                      errorText: 'Please enter at least 10 characters'),
                ]),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 40.0,
                  ),
                  hintText: 'eg , headache for almost 3 days',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(),
                  ),
                  fillColor: AppColors.backgroundColor,
                ),
              ),
              10.verticalSpace,
              Container(
                width: 375,
                height: 55,
                decoration: BoxDecoration(
                  color: AppColors.grayTwo,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 20.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      5.verticalSpace,
                      Center(
                        child: Icon(
                          EvaIcons.alertTriangleOutline,
                          color: Colors.red,
                        ),
                      ),
                      5.verticalSpace,
                      Text(
                        'Are you sure? you won\'t be able to \ndelere or edit this again',
                        style: textStyle,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ),
              15.verticalSpace,
              Builder(
                builder: (context) => CustomButton(
                  buttonName: 'Submit',
                  onTap: () async {
                    validate();

                    final String forDoc = widget.name;
                    final String fullName = nameController.text;
                    final String email = emailController.text;
                    final String contact = contactController.text;
                    final String problemDescription = problemController.text;
                    final String date =
                        '${daySelectingController.text}  ${monthSelectedController.text} at ${timeController.text}';

                    try {
                      await createDocAppointment(
                        forDoc,
                        fullName,
                        email,
                        contact,
                        problemDescription,
                        date,
                      );
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColors.royalBlue,
                          content: Text('Created an Appointment'),
                        ),
                      );
                    } catch (error) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            error.toString(),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
              20.verticalSpace
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle style = TextStyle(
  fontSize: 15.flexibleFontSize,
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.bold,
);

Future<DoctorAppointment> createDocAppointment(
  String forDoc,
  String fullName,
  String email,
  String contact,
  String problemDescription,
  String date,
) async {
  final http.Response response = await http.post(doctorAppointmentEndpoint,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'forDoc': forDoc,
        'fullName': fullName,
        'email': email,
        'contact': contact,
        'problemDescription': problemDescription,
        'date': date,
      }));

  if (response.statusCode == 200) {
    return DoctorAppointment.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Fields Empty or Time already taken.');
  }
}

List<String> _months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sept',
  'Oct',
  'Nov',
  'Dec',
];

var days = new List<int>.generate(30, (index) => index + 1);

List daysString = days.map((e) => e.toString()).toList();

List<String> _times = [
  '9 AM - 10AM',
  '10 AM - 11 AM',
  '11 AM - 12 PM',
  '12 PM - 1 PM',
  '1 PM - 2 PM',
  '2 PM - 3 PM',
  '3 PM - 4 PM',
  '4 PM - 5 PM',
  '5 PM - 6 PM',
];
final TextStyle textStyle = TextStyle(
  fontStyle: FontStyle.italic,
  fontSize: 16.flexibleFontSize,
  fontWeight: FontWeight.bold,
);
