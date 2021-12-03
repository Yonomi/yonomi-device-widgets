


# traitFactory method




    *[<Null safety>](https://dart.dev/null-safety)*




[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) traitFactory
([Trait](https://yonomi.co/yonomi-sdk/Trait-class.html) trait)








## Implementation

```dart
static Widget traitFactory(Trait trait) {
  switch (trait.runtimeType) {
    case LockTrait:
      return LockTraitWidget(trait);
    case PowerTrait:
      return PowerTraitWidget(trait);
    default:
      return UnknownTraitWidget(trait);
  }
}
```







