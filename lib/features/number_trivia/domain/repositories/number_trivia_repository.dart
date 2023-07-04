import 'package:dartz/dartz.dart'; // A: Either

import '../../../../core/error/failures.dart';
import '../entities/number_trivia.dart';

//**
//Repositories: contract/Definition/  dans "domaine" ... >implementation dans "data"
// */

abstract class NumberTriviaRepository {
  //Future<Either<Failure, NumberTrivia>> A
  //Failure '../../../../core/error/failures.dart';
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int? number);
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}