import 'package:seventh_main/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:seventh_main/domain/entities/doc_appointment_entity.dart';
import 'package:seventh_main/domain/entities/no_params.dart';
import 'package:seventh_main/domain/repository/api_repository.dart';
import 'package:seventh_main/domain/usecases/usecase.dart';

class GetDoctorAppointment
    extends UseCase<List<DoctorAppointmentEntity>, NoParams> {
  final ApiRepository apiRepository;

  GetDoctorAppointment(this.apiRepository);

  @override
  Future<Either<AppError, List<DoctorAppointmentEntity>>> call(
      NoParams params) {
    return apiRepository.getDoctorAppointment();
  }
}
