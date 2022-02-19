


# setBrightnessLevelAction method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> setBrightnessLevelAction
([int](https://api.flutter.dev/flutter/dart-core/int-class.html) brightnessLevel, {[GetDeviceDetailsMethod](../../providers_device_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails, [SendBrightnessFunction](../../providers_brightness_provider/SendBrightnessFunction.md) sendBrightnessLevel = BrightnessRepository.setBrightnessAction})








## Implementation

```dart
Future<void> setBrightnessLevelAction(int brightnessLevel,
    {GetDeviceDetailsMethod getDetails = DevicesRepository.getDeviceDetails,
    SendBrightnessFunction sendBrightnessLevel =
        BrightnessRepository.setBrightnessAction}) {
  return performAction<int>(brightnessLevel, () => getBrightnessState,
      () => sendBrightnessLevel(_request, _deviceId, brightnessLevel),
      getDetails: getDetails);
}
```







