


# buildTraitRows method




    *[<Null safety>](https://dart.dev/null-safety)*




[List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Row](https://api.flutter.dev/flutter/widgets/Row-class.html)> buildTraitRows
([List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Trait](https://yonomi.co/yonomi-sdk/Trait-class.html)> traits)








## Implementation

```dart
static List<Row> buildTraitRows(List<Trait> traits) {
  List<Row> traitRows = [];
  for (var trait in traits) {
    traitRows.add(
      Row(
        children: [traitFactory(trait)],
      ),
    );
  }
  return traitRows;
}
```







