sealed class Result<T> {
  const Result();

  const factory Result.success({
    required T data,
  }) = SuccessResult;

  const factory Result.error() = ErrorResult;
}

final class SuccessResult<T> extends Result<T> {
  final T data;

  const SuccessResult({
    required this.data,
  });
}

final class ErrorResult<T> extends Result<T> {
  const ErrorResult();
}
