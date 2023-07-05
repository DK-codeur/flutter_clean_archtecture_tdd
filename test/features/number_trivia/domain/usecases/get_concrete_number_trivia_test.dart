
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

  //instanciation, setUp
    late GetConcreteNumberTrivia usecase; //sut (Usecase)
    late MockNumberTriviaRepository mockNumberTriviaRepository; //mock

    setUp(() {
      mockNumberTriviaRepository = MockNumberTriviaRepository(); //mock
      usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository); //sut (A)

    });


    const tNumber = 1;
    const tNumberTrivia = NumberTrivia(text: "test", number: 1);

    test(
      "should get trivia for the number from repository", 
      () async {

        // "On the fly" implementation of the Repository using the Mockito package.
        // When getConcreteNumberTrivia is called with any argument, always answer with
        // the Right "side" of Either containing a test NumberTrivia object.
        
        //arrange
        when(
          mockNumberTriviaRepository.getConcreteNumberTrivia(any)
        ).thenAnswer((_) async => const Right(tNumberTrivia));

        //act
        final result = await usecase.execute(number: tNumber);

        //assert
        // UseCase should simply return whatever was returned from the Repository
        expect(result, const Right(tNumberTrivia));

        // Verify that the method has been called on the Repository
        verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));

        // Only the above method should be called and nothing more.
        verifyNoMoreInteractions(mockNumberTriviaRepository);
      }
    );
  }