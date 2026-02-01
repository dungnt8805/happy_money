import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_money/app/services/shared_storage/shared_storage.dart';
import 'package:happy_money/presentation/routes/app_router.dart';

part 'splash_state.dart';

enum AppInitStatus { appFirstRun, initialized, initializedError }

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial());

  void appInitialize() async {
    await Future.delayed(const Duration(seconds: 2));
    final (:status, :err, :stackTrace) = await _initialize();

    switch (status) {
      case AppInitStatus.appFirstRun:
        appRouter.replace(const ContainerRoute());
        break;
      case AppInitStatus.initialized:
        appRouter.replace(const ContainerRoute());
        break;
      case AppInitStatus.initializedError:
        appRouter.replace(const ContainerRoute());
        break;
    }
  }

  bool checkAppFirstRun() {
    try {
      final bool? isOpenBefore = SharedStorageKey.appHasOpened.read<bool>();
      if (isOpenBefore == null || !isOpenBefore) {
        unawaited(_setAppHasOpened());
        return true;
      }
      return false;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<({AppInitStatus status, Object? err, StackTrace? stackTrace})>
  _initialize() async {
    final isAppFirstRun = checkAppFirstRun();
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      return (
        status: isAppFirstRun
            ? AppInitStatus.appFirstRun
            : AppInitStatus.initialized,
        err: null,
        stackTrace: null,
      );
    } catch (e, s) {
      return (status: AppInitStatus.initializedError, err: e, stackTrace: s);
    }
  }

  Future<void> _setAppHasOpened() async {
    await SharedStorageKey.appHasOpened.write(true);
  }
}
