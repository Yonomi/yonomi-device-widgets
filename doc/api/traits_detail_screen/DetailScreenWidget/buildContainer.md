


# buildContainer method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) buildContainer
([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Trait](https://yonomi.co/yonomi-sdk/Trait-class.html)> traits)








## Implementation

```dart
Widget buildContainer(List<Trait> traits) {
  return Container(
      alignment: Alignment.center,
      child: Center(
          child: Column(children: [
        _card(_createTraitWidget(traits.first)),
        ...traits.skip(1).map((trait) {
          return _card(_createTraitListWidget(trait));
        }).toList()
      ])));
}
```







