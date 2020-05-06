import 'package:mobx/mobx.dart';

extension ObservableFutureExtension<T> on ObservableFuture<T> {
  ObservableFuture<E> map<E>(Future<E> Function(ObservableFuture<T>) transform) => transform(this).asObservable();
}

extension FutureExtension<T> on Future<T> {
  Future<E> map<E>(Future<E> Function(Future<T>) transform) => transform(this);
}

extension StringExtension on String {
  String getNameFromEnum() {
    if(this == null || !contains(".")) return this;
    return replaceRange(0, indexOf("."), "");
  }
}