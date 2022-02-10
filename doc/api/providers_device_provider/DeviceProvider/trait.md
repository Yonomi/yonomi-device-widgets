


# trait&lt;T extends Trait> method




    *[<Null safety>](https://dart.dev/null-safety)*




[Trait](https://yonomi.co/yonomi-sdk/Trait-class.html)? trait
&lt;T extends Trait>()








## Implementation

```dart
sdk.Trait? trait<T extends sdk.Trait>() {
  return deviceDetail?.traits.firstWhere((trait) => trait is T,
      orElse: () => sdk.UnknownTrait(displayName));
}
```







