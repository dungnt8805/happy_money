part of utils;

///
/// 「list」Defines a type extensions function.
///

extension ExtendedIterable<E> on Iterable<E> {
  /// Like Iterable<T>.forEach but callback have index as second argument
  void forEachIndexed(void Function(E e, int i) f) {
    int i = 0;
    forEach((e) => f(e, i++));
  }

  /// Like Iterable<T>.map<T> but callback have index as second argument
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    int i = 0;
    return map<T>((e) => f(e, i++));
  }

  Map<K, List<E>> groupBy<K>(K Function(E) keyFn) => fold(
    <K, List<E>>{},
    (Map<K, List<E>> map, E element) =>
        map..putIfAbsent(keyFn(element), () => <E>[]).add(element),
  );
}

// extension ListSocialLinkExt on List<UserLinkEntity> {
//   List<UserLinkEntity> getLinksByType(SocialLinkType type) {
//     try {
//       if (type != SocialLinkType.another) {
//         final UserLinkEntity link = firstWhere((element) => element.type == type);
//         return [link];
//       } else {
//         final links = where((element) => element.type == type).toList();
//         return links;
//       }
//     } catch (e) {
//       return [];
//     }
//   }
// }
