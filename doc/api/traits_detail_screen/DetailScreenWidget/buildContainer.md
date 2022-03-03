


# buildContainer method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) buildContainer
([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Trait](https://yonomi.co/yonomi-sdk/Trait-class.html)> traits)








## Implementation

```dart
Widget buildContainer(List<Trait> traits) {
  final displayTraits = (traits.isEmpty) ? [UnknownTrait('UNKNOWN')] : traits;
  final deviceWidget = DeviceWidgetBuilder()
      .withPrimaryTrait(displayTraits.first)
      .withTraits(displayTraits.skip(1).toList())
      .build();

  return Container(
      alignment: Alignment.center, child: Center(child: deviceWidget));
}
```







