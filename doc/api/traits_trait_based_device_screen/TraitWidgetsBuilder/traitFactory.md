


# traitFactory method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) traitFactory
([Request](https://yonomi.co/yonomi-sdk/Request-class.html) req, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, [Trait](https://yonomi.co/yonomi-sdk/Trait-class.html) trait)








## Implementation

```dart
static Widget traitFactory(Request req, String deviceId, Trait trait) {
  switch (trait.runtimeType) {
    case LockTrait:
      return LockTraitWidget(trait);
    case PowerTrait:
      return PowerTraitWidget(req, deviceId, trait);
    default:
      return UnknownTraitWidget(trait);
  }
}
```







