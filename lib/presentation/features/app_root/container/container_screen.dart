import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_money/presentation/features/app_root/constants/container_constants.dart';
import 'package:happy_money/presentation/features/app_root/container/controller/container_cubit.dart';
import 'package:happy_money/presentation/features/app_root/container/widgets/add_transaction_bottom_sheet_modal.dart';
import 'package:happy_money/presentation/routes/app_router.dart';

@RoutePage()
class ContainerScreen extends StatefulWidget {
  const ContainerScreen({super.key});

  @override
  State<ContainerScreen> createState() => _ContainerScreenState();
}

class _ContainerScreenState extends State<ContainerScreen> {
  late ContainerCubit containerCubit;

  @override
  void initState() {
    containerCubit = context.read<ContainerCubit>();
    super.initState();
  }

  // final
  @override
  Widget build(BuildContext context) {
    final tabSelected = context.select(
      (ContainerCubit cubit) => cubit.state.selectedIndexTab,
    );
    return PopScope(
      canPop: false,
      child: AutoTabsScaffold(
        resizeToAvoidBottomInset: false,
        routes: containerCubit.state.routes,
        floatingActionButton: FloatingActionButton(
          onPressed: () => {appRouter.push(CategoriesRoute())},
          shape: CircleBorder(),
          child: const Icon(Icons.add),
        ),
        bottomNavigationBuilder: (context, tabsRouter) {
          containerCubit.initializeTabsRouter(tabsRouter);
          return BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            currentIndex: tabSelected.index,
            onTap: (value) =>
                containerCubit.bottomTabChanged(RouteIdxTab.values[value]),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.wallet), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
            ],
          );
        },
      ),
    );
  }
}
