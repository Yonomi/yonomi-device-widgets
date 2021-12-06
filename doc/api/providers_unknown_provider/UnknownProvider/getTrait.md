


# getTrait method




    *[<Null safety>](https://dart.dev/null-safety)*




[Trait](https://yonomi.co/yonomi-sdk/Trait-class.html) getTrait
()








## Implementation

```dart
Trait getTrait() {
  return deviceDetails.traits
      .skipWhile((trait) => !(trait is UnknownTrait))
      .first;
}
```







