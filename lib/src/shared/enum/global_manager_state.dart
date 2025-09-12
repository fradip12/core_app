enum GlobalManagerState {
  initial,
  loading,
  loaded,
  error;

  bool get isLoading => this == GlobalManagerState.loading;
  bool get isLoaded => this == GlobalManagerState.loaded;
  bool get isError => this == GlobalManagerState.error;
}
