


# sendPowerOnOffAction method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> sendPowerOnOffAction
([bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) setOnOff, {[GetDeviceDetailsMethod](../../providers_power_trait_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails, [SendPowerMethod](../../providers_power_trait_provider/SendPowerMethod.md) sendPowerMethod = PowerRepository.sendPowerAction})








## Implementation

```dart
Future<void> sendPowerOnOffAction(bool setOnOff,
    {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
    SendPowerMethod sendPowerMethod =
        PowerRepository.sendPowerAction}) async {
  if (!isPerformingAction) {
    setPerformingAction = true;

    await sendPowerMethod(_request, this._deviceId, setOnOff);

    int numRetries = 0;
    while (getPowerTrait()?.state.value != setOnOff &&
        numRetries < MAX_RETRIES) {
      _deviceDetail = await getDetails(_request, _deviceId);

      await Future.delayed(Duration(milliseconds: 750));
      numRetries++;
    }

    setPerformingAction = false;
  }
}
```







