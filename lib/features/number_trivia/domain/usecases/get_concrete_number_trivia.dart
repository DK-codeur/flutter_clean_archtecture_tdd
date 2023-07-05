
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';


//**
// write test in test useCases folder before here: 
// Usecase doit obtenir ses données à partir du Repository(le contract) (A) / il prend tjr le repository
// */

class GetConcreteNumberTrivia {
  final NumberTriviaRepository repository;
  GetConcreteNumberTrivia(this.repository); //(A)

  Future<Either<Failure, NumberTrivia>?> execute({required int number}) async {
    return await repository.getConcreteNumberTrivia(number);
  }

}