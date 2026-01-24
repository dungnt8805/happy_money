import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_money/app/helpers/injection.dart';
import 'package:happy_money/app/services/shared_storage/shared_storage.dart';
import 'package:happy_money/data/database_provider.dart';
import 'package:happy_money/presentation/routes/app_router.dart';

part 'splash_state.dart';

enum AppInitStatus { appFirstRun, initialized, initializedError }

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial());

  void appInitialize() async {
    await Future.delayed(const Duration(seconds: 2));
    await _initialize();
    if (checkAppFirstRun()) {
    } else {
      appRouter.replace(ContainerRoute());
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
    try {
      getIt<DatabaseProvider>().initialize();
      return (status: AppInitStatus.initialized, err: null, stackTrace: null);
    } catch (e, s) {
      return (status: AppInitStatus.initializedError, err: e, stackTrace: s);
    }
  }

  Future<void> _setAppHasOpened() async {
    await SharedStorageKey.appHasOpened.write(true);
  }
}
