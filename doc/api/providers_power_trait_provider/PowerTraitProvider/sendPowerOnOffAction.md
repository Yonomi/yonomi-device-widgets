


# sendPowerOnOffAction method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> sendPowerOnOffAction
([bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) desiredOnOffState, {[GetDeviceDetailsMethod](../../providers_device_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails, [SendPowerMethod](../../providers_power_trait_provider/SendPowerMethod.md) sendPowerMethod = PowerRepository.sendPowerAction})





<p>Run the "makePowerActionRequest" mutation on this device</p>
<p>@param desiredOnOffState use true to set power state to on, false otherwise
@throws ServerException for any errors returned by the platform</p>



## Implementation

```dart
Future<void> sendPowerOnOffAction(bool desiredOnOffState,
    {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
    SendPowerMethod sendPowerMethod =
        PowerRepository.sendPowerAction}) async {
  if (!isPerformingAction) {
    setState = WidgetState.performingAction;

    try {
      await sendPowerMethod(_request, this._deviceId, desiredOnOffState);

      int numRetries = 0;
      while (getOnOffState != desiredOnOffState && numRetries < MAX_RETRIES) {
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







