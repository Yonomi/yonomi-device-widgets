


# getDeviceDetails method




    *[<Null safety>](https://dart.dev/null-safety)*




[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> getDeviceDetails
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetDeviceDetails](../../providers_device_provider/GetDeviceDetails.md) getDetails = DevicesRepository.getDeviceDetails})








## Implementation

```dart
Future<void> getDeviceDetails(String deviceId,
    {GetDeviceDetails getDetails =
        DevicesRepository.getDeviceDetails}) async {
  loadingDetail = true;
  notifyListeners();

  _deviceDetails = await getDetails(_request, deviceId);

  loadingDetail = false;
  notifyListeners();
}
```







