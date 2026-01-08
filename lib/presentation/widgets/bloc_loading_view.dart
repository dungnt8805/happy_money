part of loading_indicator;

class BlocLoadingView<B extends BlocBase<S>, S> extends StatelessWidget {
  const BlocLoadingView({
    required this.loadingWhen,
    this.bloc,
    this.builder,
    this.width,
    this.height,
    this.radius = 14,
    this.color,
    this.backgroundColor,
    this.alignment,
    super.key,
  });

  final B? bloc;
  final bool Function(S state) loadingWhen;
  final LoadingIndicatorBuilder? builder;

  final double? width;
  final double? height;
  final double radius;
  final Color? color;
  final Color? backgroundColor;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<B, S, bool>(
      bloc: bloc,
      selector: loadingWhen,
      builder: (context, isLoading) {
        if (builder != null) return builder!.call(context, isLoading);

        return AnimatedLoadingCrossFade(
          isLoading: isLoading,
          radius: radius,
          width: width,
          height: height,
          color: color,
          backgroundColor: backgroundColor,
          alignment: alignment,
        );
      },
    );
  }
}
