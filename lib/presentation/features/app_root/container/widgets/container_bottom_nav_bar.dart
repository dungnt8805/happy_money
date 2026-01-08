import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_money/app/themes/app_theme.dart';
import 'package:happy_money/app/themes/spacing.dart';
import 'package:happy_money/presentation/features/app_root/constants/container_constants.dart';
import 'package:happy_money/presentation/features/app_root/container/controller/container_cubit.dart';
import 'package:happy_money/presentation/features/app_root/container/widgets/container_nav_bar_item.dart';

class ContainerBottomNavBar extends StatefulWidget {
  const ContainerBottomNavBar(this.selectedIndexTab, {super.key});
  final RouteIdxTab selectedIndexTab;

  @override
  State<ContainerBottomNavBar> createState() => _ContainerBottomNavBarState();
}

class _ContainerBottomNavBarState extends State<ContainerBottomNavBar> {
  RouteIdxTab get selectedIndexTab => widget.selectedIndexTab;
  @override
  Widget build(BuildContext context) {
    final containerCubit = context.read<ContainerCubit>();
    // final bgrColor = selectedIndexTab.isOverviewTab ?

    return BottomAppBar(
      color: context.appColors.background,
      surfaceTintColor: context.appColors.background,
      height: kBottomNavigationBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: Insets.medium),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContainerNavBarItem(
            indexTab: RouteIdxTab.overview,
            selectedIndexTab: selectedIndexTab,
            icon: Icons.home.toString(),
            onTap: containerCubit.bottomTabChanged,
          ),
          ContainerNavBarItem(
            indexTab: RouteIdxTab.wallet,
            selectedIndexTab: selectedIndexTab,
            icon: Icons.wallet.toString(),
            onTap: containerCubit.bottomTabChanged,
          ),
          ContainerNavBarItem(
            indexTab: RouteIdxTab.analytics,
            selectedIndexTab: selectedIndexTab,
            icon: Icons.show_chart.toString(),
            onTap: containerCubit.bottomTabChanged,
          ),
          ContainerNavBarItem(
            indexTab: RouteIdxTab.settings,
            selectedIndexTab: selectedIndexTab,
            icon: Icons.settings.toString(),
            onTap: containerCubit.bottomTabChanged,
          ),
        ],
      ),
    );
  }
}
