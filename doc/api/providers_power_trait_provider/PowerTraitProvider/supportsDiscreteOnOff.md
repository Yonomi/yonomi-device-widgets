


# supportsDiscreteOnOff property




    *[<Null safety>](https://dart.dev/null-safety)*




[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) supportsDiscreteOnOff
  







## Implementation

```dart
bool get supportsDiscreteOnOff =>
    getPowerTrait()
        ?.properties
        .whereType<SupportsDiscreteOnOff>()
        .first
        .value ??
    false;
```








