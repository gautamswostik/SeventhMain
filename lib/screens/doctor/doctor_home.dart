import 'package:flutter/material.dart';
import 'package:seventh_main/domain/entities/doctor_entity.dart';
import 'package:seventh_main/screens/doctor/doctor_detail/doctor_detail_screen.dart';
import 'package:seventh_main/util/themes/app_colors.dart';
import 'package:seventh_main/widgets/custom_card.dart';
import '../../util/extensions/size_extendion.dart';

class DoctorHome extends StatelessWidget {
  final List<DoctorEntity> doctors;

  const DoctorHome({
    Key key,
    @required this.doctors,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Doctors'),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/252-2525599_electronic-payment-services-for-group-of-doctors-cartoon.png',
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
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        10.verticalSpace,
                        CustomCard(
                          imgUrl: 'assets/1265104224.jpg',
                          title: doctors[index].name,
                          subtitle: doctors[index].type,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DoctorDetailScreen(
                                  title: doctors[index].name,
                                  type: doctors[index].type,
                                  work: doctors[index].working,
                                  email: doctors[index].contacts.email,
                                  instagram:
                                      doctors[index].contacts.social.instagram,
                                  description: doctors[index].description,
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
