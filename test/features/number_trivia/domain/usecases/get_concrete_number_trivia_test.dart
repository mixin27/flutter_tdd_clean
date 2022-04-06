import 'package:dartz/dartz.dart';
import 'package:flutter_tdd_clean/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_tdd_clean/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_tdd_clean/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumber = 1;
  const tNumberTrivia = NumberTrivia(
    text: 'test',
    number: tNumber,
  );

  test('should get trivia for the number from the repository', () async {
    // arrange
    when(() => mockNumberTriviaRepository
        .getConcreteNumberTrivia(any(that: isNotNull))).thenAnswer(
      (_) async => const Right(tNumberTrivia),
    );

    // act
    final result = await usecase(number: tNumber);

    // assert
    expect(result, const Right(tNumberTrivia));
    verify(() => mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
