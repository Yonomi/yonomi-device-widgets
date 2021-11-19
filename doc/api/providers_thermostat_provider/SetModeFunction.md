


# SetModeFunction typedef






    *[<Null safety>](https://dart.dev/null-safety)*




    [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> SetModeFunction = [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> Function([Request](https://yonomi.co/yonomi-sdk/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) id, [GThermostatMode](https://yonomi.co/third_party_yonomi_graphql_schema_schema.docs.schema.gql/GThermostatMode-class.html) mode)






## Implementation

```dart
typedef SetModeFunction = Future<void> Function(
    Request request, String id, GThermostatMode mode);
```






