import 'package:dartz/dartz.dart';
import 'package:seventh_main/domain/entities/app_error.dart';
import 'package:seventh_main/domain/entities/hospital_entities.dart';
import 'package:seventh_main/domain/entities/no_params.dart';
import 'package:seventh_main/domain/repository/api_repository.dart';
import 'package:seventh_main/domain/usecases/usecase.dart';

class GetHospital extends UseCase<List<HospitalEntity>, NoParams> {
  final ApiRepository repository;

  GetHospital(this.repository);

  @override
  Future<Either<AppError, List<HospitalEntity>>> call(NoParams params) async {
    return repository.getHospitals();
  }
}
