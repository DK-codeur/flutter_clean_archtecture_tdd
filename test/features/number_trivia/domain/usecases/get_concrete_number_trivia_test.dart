import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

//**
// mettre "_test" a la fin du nom du fichier dans lib/domain/useCases
// Usecase doit obtenir ses données à partir du Repository (A)
// */

//appel du repository
class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

void main() {
    late GetConcreteNumberTrivia usecase; //sut (Usecase)
    late MockNumberTriviaRepository mockNumberTriviaRepository; //mock

    setUp(() {
      mockNumberTriviaRepository = MockNumberTriviaRepository(); //mock
      usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository); //sut (A)
    });

    const tNumber = 1;
    final tNumberTrivia = NumberTrivia(text: "test", number: 1);

    test(
      'should get trivia for the number from repository', 
      () async {
        //arrange
         //        mock       
        when(() => mockNumberTriviaRepository.getConcreteNumberTrivia(any))?
        .thenAnswer((_) async => right(tNumberTrivia));

        //act
        final result = await usecase.execute(number: tNumber);

        //assert
        expect(result, Right(tNumberTrivia));
        verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
        verifyNoMoreInteractions(mockNumberTriviaRepository);
      }
    );
  }