import 'package:seventh_main/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:seventh_main/domain/entities/hos_appointment_entity.dart';
import 'package:seventh_main/domain/entities/no_params.dart';
import 'package:seventh_main/domain/repository/api_repository.dart';
import 'package:seventh_main/domain/usecases/usecase.dart';

class GetHospitalAppointments
    extends UseCase<List<HospitalAppointmentEntity>, NoParams> {
  final ApiRepository apiRepository;

  GetHospitalAppointments(this.apiRepository);

  @override
  Future<Either<AppError, List<HospitalAppointmentEntity>>> call(
      NoParams params) {
    return apiRepository.getHospitalAppointment();
  }
}
