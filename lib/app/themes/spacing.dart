import 'package:flutter/material.dart';

final class Insets {
  const Insets._();

  static const double scale = 1;

  // Regular paddings
  static const double zero = 0;
  static const double xxsmall = scale * 4;
  static const double xsmall = scale * 8;
  static const double small = scale * 12;
  static const double medium = scale * 16;
  static const double large = scale * 24;
  static const double xlarge = scale * 32;
  static const double xxlarge = scale * 48;
  static const double xxxlarge = scale * 64;
  static const double infinity = double.infinity;
}

final class VSpace extends StatelessWidget {
  const VSpace(this.size, {super.key});

  factory VSpace.xxsmall() => const VSpace(Insets.xxsmall);
  factory VSpace.xsmall() => const VSpace(Insets.xsmall);
  factory VSpace.small() => const VSpace(Insets.small);
  factory VSpace.medium() => const VSpace(Insets.medium);
  factory VSpace.large() => const VSpace(Insets.large);
  factory VSpace.xlarge() => const VSpace(Insets.xlarge);
  factory VSpace.xxlarge() => const VSpace(Insets.xxlarge);
  factory VSpace.xxxlarge() => const VSpace(Insets.xxxlarge);

  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(height: size);
}

final class HSpace extends StatelessWidget {
  const HSpace(this.size, {super.key});

  factory HSpace.xxsmall() => const HSpace(Insets.xxsmall);
  factory HSpace.xsmall() => const HSpace(Insets.xsmall);
  factory HSpace.small() => const HSpace(Insets.small);
  factory HSpace.medium() => const HSpace(Insets.medium);
  factory HSpace.large() => const HSpace(Insets.large);
  factory HSpace.xlarge() => const HSpace(Insets.xlarge);
  factory HSpace.xxlarge() => const HSpace(Insets.xxlarge);
  factory HSpace.xxxlarge() => const HSpace(Insets.xxxlarge);

  final double size;

  @override
  Widget build(BuildContext context) => SizedBox(width: size);
}

final class SliverVSpace extends VSpace {
  const SliverVSpace(super.size, {super.key});

  factory SliverVSpace.xxsmall() => const SliverVSpace(Insets.xxsmall);
  factory SliverVSpace.xsmall() => const SliverVSpace(Insets.xsmall);
  factory SliverVSpace.small() => const SliverVSpace(Insets.small);
  factory SliverVSpace.medium() => const SliverVSpace(Insets.medium);
  factory SliverVSpace.large() => const SliverVSpace(Insets.large);
  factory SliverVSpace.xlarge() => const SliverVSpace(Insets.xlarge);
  factory SliverVSpace.xxlarge() => const SliverVSpace(Insets.xxlarge);
  factory SliverVSpace.xxxlarge() => const SliverVSpace(Insets.xxxlarge);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: super.build(context));
  }
}

final class SliverHSpace extends HSpace {
  const SliverHSpace(super.size, {super.key});
  factory SliverHSpace.xxsmall() => const SliverHSpace(Insets.xxsmall);
  factory SliverHSpace.xsmall() => const SliverHSpace(Insets.xsmall);
  factory SliverHSpace.small() => const SliverHSpace(Insets.small);
  factory SliverHSpace.medium() => const SliverHSpace(Insets.medium);
  factory SliverHSpace.large() => const SliverHSpace(Insets.large);
  factory SliverHSpace.xlarge() => const SliverHSpace(Insets.xlarge);
  factory SliverHSpace.xxlarge() => const SliverHSpace(Insets.xxlarge);
  factory SliverHSpace.xxxlarge() => const SliverHSpace(Insets.xxxlarge);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: super.build(context));
  }
}
