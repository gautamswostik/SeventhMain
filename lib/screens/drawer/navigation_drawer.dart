import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seventh_main/bloc/docotor_appoitment/doctor_appointment_bloc.dart';
import 'package:seventh_main/bloc/hospital_appointment/hospital_appointment_bloc.dart';
import 'package:seventh_main/screens/Hospital_appointment_screen/hospital_appointment_screen.dart';
import 'package:seventh_main/screens/doctor_appointment_screen/doctor_appoitment_screen.dart';
import 'package:seventh_main/screens/drawer/navigation_list_item.dart';
import 'package:seventh_main/util/constants/size_constant.dart';
import '../../util/extensions/size_extendion.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer();

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 4,
            // blurRadius: 4,
          ),
        ],
      ),
      width: Sizes.dimen_230.flexibleWidth,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_8.flexibleHeight,
                bottom: Sizes.dimen_18.flexibleHeight,
                left: Sizes.dimen_8.flexibleWidth,
                right: Sizes.dimen_8.flexibleWidth,
              ),
            ),
            BlocBuilder<DoctorAppointmentBloc, DoctorAppointmentState>(
              builder: (context, state) {
                if (state is DoctorAppointmentLoaded) {
                  return NavigationListItem(
                    title: "Doctors Appointment",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoctorAppointmentListScreen(
                            docApointment: state.doctorAppointment,
                          ),
                        ),
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            BlocBuilder<HospitalAppointmentBloc, HospitalAppointmentState>(
              builder: (context, state) {
                if (state is HospitalAppointmentLoaded) {
                  return NavigationListItem(
                    title: "Hospitals Appointment",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HospitalAppointmentScreen(
                            hosApointment: state.hosAppointment,
                          ),
                        ),
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
