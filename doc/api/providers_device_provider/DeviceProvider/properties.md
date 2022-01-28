


# properties&lt;T extends Trait, S extends Property> method




    *[<Null safety>](https://dart.dev/null-safety)*




[Set](https://api.flutter.dev/flutter/dart-core/Set-class.html)&lt;S> properties
&lt;T extends Trait, S extends Property>()








## Implementation

```dart
Set<S> properties<T extends sdk.Trait, S extends sdk.Property>() {
  return trait<T>()?.properties.whereType<S>().toSet() ?? {};
}
```







