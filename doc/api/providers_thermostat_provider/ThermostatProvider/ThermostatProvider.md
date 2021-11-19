


# ThermostatProvider constructor




    *[<Null safety>](https://dart.dev/null-safety)*



ThermostatProvider([Request](https://yonomi.co/yonomi-sdk/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetThermostatDetailsFunction](../../providers_thermostat_provider/GetThermostatDetailsFunction.md) getThermostatDetails = DevicesRepository.getThermostatDetails})





## Implementation

```dart
ThermostatProvider(Request request, String deviceId,
    {GetThermostatDetailsFunction getThermostatDetails =
        DevicesRepository.getThermostatDetails}) {
  this._request = request;
  getDeviceDetail(deviceId, getThermostatDetails: getThermostatDetails);
}
```







