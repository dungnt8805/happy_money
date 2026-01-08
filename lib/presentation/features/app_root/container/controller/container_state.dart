part of 'container_cubit.dart';

class ContainerState extends Equatable {
  const ContainerState({
    this.routes = tabsRoutes,
    this.selectedIndexTab = RouteIdxTab.overview,
  });

  factory ContainerState.initial() => const ContainerState();

  final List<PageRouteInfo> routes;
  final RouteIdxTab selectedIndexTab;

  ContainerState copyWith({RouteIdxTab? selectedIndexTab}) {
    return ContainerState(
      selectedIndexTab: selectedIndexTab ?? this.selectedIndexTab,
    );
  }

  @override
  List<Object?> get props => [selectedIndexTab];
}
