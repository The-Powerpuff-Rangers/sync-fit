class SyncFitException implements Exception {
  final String message;
  final String? details;
  final String? stackTrace;

  SyncFitException(this.message, {this.details, this.stackTrace});

  @override
  String toString() {
    return 'SyncFitException: $message';
  }
}
