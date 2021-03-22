import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seventh_main/bloc/docotor_appoitment/doctor_appointment_bloc.dart';
import 'package:seventh_main/bloc/doctors_bloc/doctors_bloc.dart';
import 'package:seventh_main/bloc/hospital_appointment/hospital_appointment_bloc.dart';
import 'package:seventh_main/bloc/hospital_bloc/hospitals_bloc.dart';
import 'package:seventh_main/di/get_it.dart';
import 'package:seventh_main/screens/doctor/doctor_home.dart';
import 'package:seventh_main/screens/drawer/navigation_drawer.dart';
import 'package:seventh_main/screens/home/carousel_slider.dart';
import 'package:seventh_main/screens/hospitals/hospital_home.dart';
import 'package:seventh_main/widgets/custom_card.dart';
import '../../util/extensions/size_extendion.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DoctorsBloc doctorsBloc;
  HospitalsBloc hospitalsBloc;
  DoctorAppointmentBloc doctorAppointmentBloc;
  HospitalAppointmentBloc hospitalAppointmentBloc;

  @override
  void initState() {
    doctorsBloc = inject<DoctorsBloc>();
    doctorsBloc.add(DoctorLoadEvent());
    hospitalsBloc = inject<HospitalsBloc>();
    hospitalsBloc.add(HospitalLoadEvent());
    doctorAppointmentBloc = inject<DoctorAppointmentBloc>();
    doctorAppointmentBloc.add(DoctorAppontmentLoadEvent());
    hospitalAppointmentBloc = inject<HospitalAppointmentBloc>();
    hospitalAppointmentBloc.add(HospitalAppointmentLoadEvent());
    super.initState();
  }

  @override
  void dispose() {
    doctorsBloc?.close();
    hospitalsBloc?.close();
    doctorAppointmentBloc?.close();
    hospitalAppointmentBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => doctorsBloc,
        ),
        BlocProvider(
          create: (context) => hospitalsBloc,
        ),
        BlocProvider(
          create: (context) => doctorAppointmentBloc,
        ),
        BlocProvider(
          create: (context) => hospitalAppointmentBloc,
        ),
      ],
      child: Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Seventh Application',
          ),
        ),
        body: ListView(
          children: [
            ImageSlider(),
            Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 24.0,
                right: 24.0,
              ),
              child: Column(
                children: [
                  BlocBuilder<DoctorsBloc, DoctorsState>(
                    cubit: doctorsBloc,
                    builder: (context, state) {
                      if (state is DoctorLoaded) {
                        return CustomCard(
                            title: 'Browse Doctors',
                            imgUrl:
                                'assets/252-2525599_electronic-payment-services-for-group-of-doctors-cartoon.png',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoctorHome(
                                    doctors: state.doctors,
                                  ),
                                ),
                              );
                            });
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  10.verticalSpace,
                  BlocBuilder<HospitalsBloc, HospitalsState>(
                    cubit: hospitalsBloc,
                    builder: (context, state) {
                      if (state is HospitalLoadedState) {
                        return CustomCard(
                            title: 'Browse Hospitals',
                            imgUrl:
                                'assets/95732720-a-vector-cartoon-representing-a-funny-hospital-building-with-a-rescue-helicopter-on-its-roof-an-ambu.jpg',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HospitalBody(
                                    hospitals: state.hospitals,
                                  ),
                                ),
                              );
                            });
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
