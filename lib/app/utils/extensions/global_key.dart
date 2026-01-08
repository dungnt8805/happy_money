import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

extension GlobalKeyExt on GlobalKey {
  Offset? get offsetOfRenderBoxWithParent {
    final RenderBox? renderBox =
        currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.localToGlobal(Offset.zero);
  }

  Offset? get offsetOfSliverToBoxAdapterWithParent {
    final RenderSliverToBoxAdapter? renderSliverToBoxAdapter =
        currentContext?.findRenderObject() as RenderSliverToBoxAdapter?;
    final RenderBox? renderBoxOffset = renderSliverToBoxAdapter?.child;
    return renderBoxOffset?.localToGlobal(Offset.zero);
  }

  Offset? get offsetOfSliverPaddingWithParent {
    final RenderSliverPadding? renderSliverPadding =
        currentContext?.findRenderObject() as RenderSliverPadding?;
    final RenderBox? renderBoxOffset = renderSliverPadding?.child as RenderBox?;
    return renderBoxOffset?.localToGlobal(Offset.zero);
  }
}
