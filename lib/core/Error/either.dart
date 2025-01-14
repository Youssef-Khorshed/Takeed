class FetchResult<T, E> {
  final T? success;
  final E? error;

  FetchResult._({this.success, this.error});

  factory FetchResult.success(T data) {
    return FetchResult._(success: data);
  }

  factory FetchResult.error(E errorData) {
    return FetchResult._(error: errorData);
  }

  bool get isSuccess => success != null;

  bool get isError => error != null;

  R fold<R>(R Function(T success) onSuccess, R Function(E error) onError) {
    if (isSuccess) {
      return onSuccess(success as T);
    } else {
      return onError(error as E);
    }
  }
}
