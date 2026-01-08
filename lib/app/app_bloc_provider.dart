import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_money/app/app.dart';
import 'package:happy_money/presentation/features/app_root/container/controller/container_cubit.dart';
import 'package:happy_money/presentation/features/setting/controller/setting_app_cubit/app_setting_cubit.dart';
import 'package:happy_money/presentation/features/start/splash/controller/splash_cubit.dart';

class AppBlocProvider extends StatelessWidget {
  const AppBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SplashCubit()),
        BlocProvider(create: (_) => ContainerCubit()),
        BlocProvider(create: (_) => AppSettingCubit()),
      ],
      child: const App(),
    );
  }
}
