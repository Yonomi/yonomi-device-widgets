


# setColorAction method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> setColorAction
([HSBColor](https://yonomi.co/yonomi-sdk/HSBColor-class.html) color)








## Implementation

```dart
Future<void> setColorAction(HSBColor color) {
  return performAction<HSBColor>(color, () => getColorState,
      () => sendSetColorAction(_request, _deviceId, color),
      getDetails: getDetails);
}
```







