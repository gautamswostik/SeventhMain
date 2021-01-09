import 'package:dartz/dartz.dart';
import 'package:seventh_main/domain/entities/app_error.dart';

abstract class UseCase<T , Params>{
  Future<Either<AppError , T>> call(Params params);
}