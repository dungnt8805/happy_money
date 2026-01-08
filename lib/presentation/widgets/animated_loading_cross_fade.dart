part of loading_indicator;

class AnimatedLoadingCrossFade extends StatelessWidget {
  const AnimatedLoadingCrossFade({
    required this.isLoading,
    this.radius,
    this.width,
    this.height,
    this.color,
    this.backgroundColor,
    this.alignment,
    this.child,
    super.key,
  });

  final bool isLoading;
  final double? radius;
  final double? width;
  final double? height;
  final Color? color;
  final Color? backgroundColor;
  final Alignment? alignment;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: 500.ms,
      alignment: alignment ?? Alignment.center,
      crossFadeState: isLoading
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      firstChild: _buildLoadingView(),
      secondChild: child ?? const SizedBox.shrink(),
    );
  }

  Widget _buildLoadingView() => SizedBox(
    width: width ?? 100.w,
    height: height ?? 100.h,
    child: Scaffold(
      backgroundColor: backgroundColor ?? Colors.black54,
      body: Align(
        alignment: alignment ?? Alignment.center,
        child: AnimatedLoadingIndicator(
          isLoading: isLoading,
          color: color,
          radius: radius,
        ),
      ),
    ),
  );
}
