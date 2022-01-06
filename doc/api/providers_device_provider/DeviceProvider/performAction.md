


# performAction&lt;T> method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> performAction
&lt;T>(T state, T desiredState, [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html) action, {[GetDeviceDetailsMethod](../../providers_device_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails})








## Implementation

```dart
Future<void> performAction<T>(T state, T desiredState, Function action,
    {GetDeviceDetailsMethod getDetails =
        DevicesRepository.getDeviceDetails}) async {
  if (!isPerformingAction) {
    setState = WidgetState.performingAction;

    try {
      await action.call();

      int numRetries = 0;
      while (state != desiredState && numRetries < MAX_RETRIES) {
        await getDetails(_request, _deviceId);

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







