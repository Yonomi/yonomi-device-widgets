


# sendPowerOnOffAction method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> sendPowerOnOffAction
([bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) desiredOnOffState, {[GetDeviceDetailsMethod](../../providers_power_trait_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails, [SendPowerMethod](../../providers_power_trait_provider/SendPowerMethod.md) sendPowerMethod = PowerRepository.sendPowerAction})








## Implementation

```dart
Future<void> sendPowerOnOffAction(bool desiredOnOffState,
    {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
    SendPowerMethod sendPowerMethod =
        PowerRepository.sendPowerAction}) async {
  if (!isPerformingAction) {
    setPerformingAction = true;

    try {
      await sendPowerMethod(_request, this._deviceId, desiredOnOffState);

      int numRetries = 0;
      while (getOnOffState != desiredOnOffState && numRetries < MAX_RETRIES) {
        _deviceDetail = await getDetails(_request, _deviceId);

        await Future.delayed(Duration(milliseconds: 750));
        numRetries++;
      }
      setPerformingAction = false;
    } catch (error) {
      setErrorMessage = error.toString();
      setErrorState = true;
      await Future.delayed(Duration(seconds: 1))
          .then((_) => setErrorState = false);
    }
  }
}
```







