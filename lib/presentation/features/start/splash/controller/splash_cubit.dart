import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_money/app/services/shared_storage/shared_storage.dart';
import 'package:happy_money/presentation/routes/app_router.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial());

  void appInitialize() async {
    await Future.delayed(const Duration(seconds: 2));
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

  Future<void> _setAppHasOpened() async {
    await SharedStorageKey.appHasOpened.write(true);
  }
}
