import 'package:dartz/dartz.dart';
import 'package:seventh_main/domain/entities/app_error.dart';
import 'package:seventh_main/domain/entities/doctor_entity.dart';
import 'package:seventh_main/domain/entities/no_params.dart';
import 'package:seventh_main/domain/repository/api_repository.dart';
import 'package:seventh_main/domain/usecases/usecase.dart';

class GetDoctors extends UseCase<List<DoctorEntity>, NoParams> {
  final ApiRepository repository;

  GetDoctors(this.repository);

  @override
  Future<Either<AppError, List<DoctorEntity>>> call(NoParams noParams) async {
    return repository.getDoctors();
  }
}
