extension FutureExtension<T> on Future<T> {
  Future<E> map<E>(Future<E> Function(Future<T>) transform) => transform(this);
}