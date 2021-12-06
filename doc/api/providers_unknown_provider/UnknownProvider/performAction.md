


# performAction method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> performAction
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[DoAction](../../providers_unknown_provider/DoAction.md) doAction = doAction})








## Implementation

```dart
Future<void> performAction(String deviceId,
    {DoAction doAction = doAction}) async {
  loadingAction = true;
  notifyListeners();

  final traitValue = getTrait().state.value;
  await doAction(request, deviceId);

  var retries = 0;
  while (traitValue == getTrait().state.value && retries++ < 10) {
    getDeviceDetails(deviceId).timeout(Duration(milliseconds: 750));
    await Future.delayed(Duration(milliseconds: 750));
  }

  loadingAction = false;
  notifyListeners();
}
```







