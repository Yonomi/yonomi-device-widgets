


# buildTraitRows method




    *[<Null safety>](https://dart.dev/null-safety)*




[List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Row](https://api.flutter.dev/flutter/widgets/Row-class.html)> buildTraitRows
([Request](https://yonomi.co/yonomi-sdk/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, [List](https://api.flutter.dev/flutter/dart-core/List-class.html)&lt;[Trait](https://yonomi.co/yonomi-sdk/Trait-class.html)> traits)








## Implementation

```dart
static List<Row> buildTraitRows(
    Request request, String deviceId, List<Trait> traits) {
  List<Row> traitRows = [];
  for (var trait in traits) {
    traitRows.add(
      Row(
        children: [traitFactory(request, deviceId, trait)],
      ),
    );
  }
  return traitRows;
}
```







