


# performAction&lt;T> method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> performAction
&lt;T>(T desiredState, [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html) getState, [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html) action, {[GetDeviceDetailsMethod](../../providers_device_provider/GetDeviceDetailsMethod.md) getDetails = sdk.DevicesRepository.getDeviceDetails})








## Implementation

```dart
Future<void> performAction<T>(
    T desiredState, Function getState, Function action,
    {GetDeviceDetailsMethod getDetails =
        sdk.DevicesRepository.getDeviceDetails}) async {
  if (!isPerformingAction) {
    setState = WidgetState.performingAction;

    try {
      await action();
      int numRetries = 0;
      T state = getState();
      while (state != desiredState && numRetries < MAX_RETRIES) {
        _deviceDetail = await getDetails(_request, _deviceId);
        state = getState();
        await Future.delayed(Duration(milliseconds: RETRY_DELAY_MS));
        numRetries++;
      }

      setState = WidgetState.idle;
    } catch (error) {
      setErrorState(error.toString());
      await Future.delayed(Duration(seconds: 1))
          .then((_) => setState = WidgetState.idle);
    }
  }
}
```







