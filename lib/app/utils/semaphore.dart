part of utils;

/// [Semaphore] is a semaphore for resource management.
/// (※ Also called `mutex`.)
///
/// NOTE :
/// When using it, set the time up so that deadlock does not occur.
///

/// The [_waitForever] is not actually permanent, but it is long enough.
const int _waitForever = 600;

class Semaphore {
  Semaphore({int timeUp = _waitForever}) : _timeUp = Duration(seconds: timeUp);

  final Duration _timeUp;

  Timer? _timer;
  bool _semaphore = false;

  ///
  /// Semaphore acquisition
  /// Acquires a permit from this semaphore, asynchronously blocking until one
  /// is available.
  ///
  /// success : true
  /// fail    : false
  bool acquire() {
    if (_semaphore == true) {
      return false;
    }

    _timer = Timer.periodic(_timeUp, (timer) {
      // Resource release (avoid deadlock)
      _semaphore = false;
    });

    _semaphore = true;

    return true;
  }

  ///
  /// semaphore release
  ///
  void release() {
    // Stop the timer to avoid deadlock.

    if (_timer != null && (_timer?.isActive ?? false) == true) {
      _timer!.cancel();
    }

    // Resource release (avoid deadlock)
    _semaphore = false;
  }

  ///
  /// Wait for semaphore acquisition
  ///
  Future<void> wait() async {
    await Future.doWhile(() async {
      await Future.delayed(const Duration(milliseconds: 250));

      return _semaphore;
    });
  }
}
