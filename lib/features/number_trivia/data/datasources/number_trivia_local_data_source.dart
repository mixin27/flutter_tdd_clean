import '../models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  /// Gets the cached [NumberTriviaModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws a [CacheException] if no cached data is present.
  Future<NumberTriviaModel> getLastNumberTrivia();

  /// Store the last [NumberTriviaModel] which was gotten the last time.
  ///
  /// Throws a [CacheException]
  Future<void> cacheNumberTrivia(NumberTriviaModel triviaModel);
}
