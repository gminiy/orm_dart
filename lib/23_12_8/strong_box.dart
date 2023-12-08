class StrongBox<E> {
  E?  _instance;

  E? get() => _instance;

  void put(E instance) {
    _instance = instance;
  }
}