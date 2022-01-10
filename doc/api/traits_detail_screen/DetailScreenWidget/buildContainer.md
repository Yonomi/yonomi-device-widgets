


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
        _card(_createTraitWidget(traits.first), const EdgeInsets.all(8.0),
            const EdgeInsets.only(bottom: 8.0)),
        ...traits.skip(1).map((trait) {
          return _card(
              _createTraitListWidget(trait),
              const EdgeInsets.all(8.0),
              const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0));
        }).toList()
      ])));
}
```







