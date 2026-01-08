import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_money/presentation/features/app_root/constants/container_constants.dart';

part 'container_state.dart';

class ContainerCubit extends Cubit<ContainerState> {
  ContainerCubit() : super(ContainerState.initial());
  late TabsRouter _tabsRouter;

  void initializeTabsRouter(TabsRouter tabsRouter) => _tabsRouter = tabsRouter;

  Future<void> _setActiveIndex(RouteIdxTab tab) async {
    _tabsRouter.setActiveIndex(tab.idx);
    emit(state.copyWith(selectedIndexTab: tab));
  }

  void bottomTabChanged(RouteIdxTab tab) {
    if (tab != state.selectedIndexTab) {
      _setActiveIndex(tab);
    }
  }
  
}
