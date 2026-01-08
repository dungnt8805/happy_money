import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';

class FBAnalytics {
  factory FBAnalytics() => _instance ??= FBAnalytics._();

  FBAnalytics._()
    : _analytics = FirebaseAnalytics.instance,
      observer = FirebaseAnalyticsObserver(
        analytics: FirebaseAnalytics.instance,
      );

  static FBAnalytics? _instance;
  final FirebaseAnalytics _analytics;
  final FirebaseAnalyticsObserver observer;

  void log({required String name, Map<String, Object>? parameters}) {
    unawaited(
      _analytics
          .logEvent(name: name, parameters: parameters)
          .then((value) => null),
    );
  }

  void logScreen({
    required String eventName,
    String? screenName,
    Map<String, Object>? parameters,
  }) {
    unawaited(
      _analytics.logScreenView(screenName: screenName ?? 'null').then((value) {
        _analytics
            .logEvent(name: eventName, parameters: parameters)
            .then((value) => null);
      }),
    );
  }

  void logError({
    required String name,
    required Object error,
    StackTrace? stackTrace,
    Map<String, Object>? parameters,
  }) {
    unawaited(
      _analytics
          .logEvent(
            name: name,
            parameters: {
              'error': error.toString(),
              if (stackTrace != null) 'stackTrace': stackTrace.toString(),
              ...?parameters,
            },
          )
          .then((value) => null),
    );
  }
}
