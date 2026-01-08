///
/// Secure storage error definition
///
part of shared_storage;

class SharedStorageException implements Exception {
  SharedStorageException([this.message]);

  SharedStorageException.withInner(
    this.code, [
    this.message,
    this.innerException,
    this.stackTrace,
  ]);

  int code = -1;
  String? message;
  Exception? innerException;
  StackTrace? stackTrace;

  @override
  String toString() {
    if (message == null) return 'SharedStorageException';

    if (innerException == null) {
      return 'SharedStorageException $code: $message';
    }

    return 'SharedStorageException $code: $message (Inner exception: $innerException)\n\n${stackTrace?.toString() ?? ''}';
  }
}
