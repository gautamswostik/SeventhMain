import 'package:flutter/material.dart';
import 'package:seventh_main/domain/entities/hospital_entities.dart';
import 'package:seventh_main/screens/hospitals/hospital_detail_screen/hospital_detail_screen.dart';
import 'package:seventh_main/util/themes/app_colors.dart';
import 'package:seventh_main/widgets/custom_card.dart';
import '../../util/extensions/size_extendion.dart';

class HospitalBody extends StatelessWidget {
  final List<HospitalEntity> hospitals;

  const HospitalBody({
    Key key,
    this.hospitals,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Hospitals'),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/95732720-a-vector-cartoon-representing-a-funny-hospital-building-with-a-rescue-helicopter-on-its-roof-an-ambu.jpg',
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.7,
            maxChildSize: 1,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: AppColors.royalBlue),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: hospitals.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        10.verticalSpace,
                        CustomCard(
                          imgUrl:
                              'assets/76783383-set-hospital-building-cartoon-modern-vector-illustration-medical-clinic-and-city-background-emergenc.jpg',
                          title: hospitals[index].name,
                          subtitle: hospitals[index].locations.country,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HospitalDetailScreen(
                                  title: hospitals[index].name,
                                  serviceType1: hospitals[index].services.types.type1,
                                  serviceType2: hospitals[index].services.types.type2,
                                  open: hospitals[index].services.time,
                                  email: hospitals[index].contacts.email,
                                  contact: hospitals[index].contacts.phone,
                                  facebook: hospitals[index].contacts.social.facebook,
                                  instagram: hospitals[index].contacts.social.instagram,
                                  country: hospitals[index].locations.country,
                                  city: hospitals[index].locations.city,
                                  sub: hospitals[index].locations.subCity,
                                  description: hospitals[index].description,
                                ),
                              ),
                            );
                          },
                        ),
                        5.verticalSpace,
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
