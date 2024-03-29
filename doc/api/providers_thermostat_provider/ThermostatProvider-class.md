


# ThermostatProvider class






    *[<Null safety>](https://dart.dev/null-safety)*





**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [DeviceProvider](../providers_device_provider/DeviceProvider-class.md)
- ThermostatProvider






## Constructors

[ThermostatProvider](../providers_thermostat_provider/ThermostatProvider/ThermostatProvider.md) ([Request](https://yonomi.co/yonomi-sdk/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetDeviceDetailsMethod](../providers_device_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails})

    


## Properties

##### [deviceDetail](../providers_device_provider/DeviceProvider/deviceDetail.md) &#8594; [Device](https://yonomi.co/yonomi-sdk/Device-class.html)?



   
_read-only, inherited_



##### [displayName](../providers_thermostat_provider/ThermostatProvider/displayName.md) &#8594; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



   
_read-only, override_



##### [getAmbientTemperatureState](../providers_thermostat_provider/ThermostatProvider/getAmbientTemperatureState.md) &#8594; [double](https://api.flutter.dev/flutter/dart-core/double-class.html)?



   
_read-only_



##### [getAvailableFanModes](../providers_thermostat_provider/ThermostatProvider/getAvailableFanModes.md) &#8594; [Set](https://api.flutter.dev/flutter/dart-core/Set-class.html)&lt;[AvailableFanMode](https://yonomi.co/yonomi-sdk/AvailableFanMode.html)>



   
_read-only_



##### [getAvailableThermostatModes](../providers_thermostat_provider/ThermostatProvider/getAvailableThermostatModes.md) &#8594; [Set](https://api.flutter.dev/flutter/dart-core/Set-class.html)&lt;[AvailableThermostatMode](https://yonomi.co/yonomi-sdk/AvailableThermostatMode.html)>



   
_read-only_



##### [getCoolTemperatureRange](../providers_thermostat_provider/ThermostatProvider/getCoolTemperatureRange.md) &#8594; [TemperatureRange](https://yonomi.co/yonomi-sdk/TemperatureRange-class.html)?



   
_read-only_



##### [getErrorMessage](../providers_device_provider/DeviceProvider/getErrorMessage.md) &#8594; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



Get the error message whenever this ChangeNotifier had an error
See also: <a href="../providers_device_provider/DeviceProvider/isInErrorState.md">isInErrorState</a>   
_read-only, inherited_



##### [getFanModeState](../providers_thermostat_provider/ThermostatProvider/getFanModeState.md) &#8594; [AvailableFanMode](https://yonomi.co/yonomi-sdk/AvailableFanMode.html)



   
_read-only_



##### [getHeatTemperatureRange](../providers_thermostat_provider/ThermostatProvider/getHeatTemperatureRange.md) &#8594; [TemperatureRange](https://yonomi.co/yonomi-sdk/TemperatureRange-class.html)?



   
_read-only_



##### [getModeState](../providers_thermostat_provider/ThermostatProvider/getModeState.md) &#8594; [AvailableThermostatMode](https://yonomi.co/yonomi-sdk/AvailableThermostatMode.html)



   
_read-only_



##### [getTargetTemperatureState](../providers_thermostat_provider/ThermostatProvider/getTargetTemperatureState.md) &#8594; [double](https://api.flutter.dev/flutter/dart-core/double-class.html)?



   
_read-only_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object. [...](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)  
_read-only, inherited_



##### [hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether any listeners are currently registered. [...](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)  
_@[protected](https://pub.dev/documentation/meta/1.7.0/meta/protected-constant.html), read-only, inherited_



##### [isBusy](../providers_device_provider/DeviceProvider/isBusy.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



To know if this ChangeNotifier is busy from fetching data or running an action   
_read-only, inherited_



##### [isInErrorState](../providers_device_provider/DeviceProvider/isInErrorState.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



To know if this ChangeNotifier had an error
see <a href="../providers_device_provider/DeviceProvider/getErrorMessage.md">getErrorMessage</a> to get the accomponying error message   
_read-only, inherited_



##### [isLoading](../providers_device_provider/DeviceProvider/isLoading.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



To know if this ChangeNotifier is fetching device data   
_read-only, inherited_



##### [isPerformingAction](../providers_device_provider/DeviceProvider/isPerformingAction.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



To know if this ChangeNotifier is performing an action   
_read-only, inherited_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.   
_read-only, inherited_



##### [setState](../providers_device_provider/DeviceProvider/setState.md) &#8592; [WidgetState](../providers_widget_state/WidgetState.md)



   
_write-only, inherited_




## Methods

##### [addListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Register a closure to be called when the object changes. [...](https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html)  
_inherited_



##### [dispose](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)() void



Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
<a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/addListener.html">addListener</a> and <a href="https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html">removeListener</a> will throw after the object is
disposed). [...](https://api.flutter.dev/flutter/foundation/ChangeNotifier/dispose.html)  
_@[mustCallSuper](https://pub.dev/documentation/meta/1.7.0/meta/mustCallSuper-constant.html), inherited_



##### [fetchData](../providers_device_provider/DeviceProvider/fetchData.md)({[GetDeviceDetailsMethod](../providers_device_provider/GetDeviceDetailsMethod.md) getDetails = sdk.DevicesRepository.getDeviceDetails}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



   
_inherited_



##### [getThermostatTrait](../providers_thermostat_provider/ThermostatProvider/getThermostatTrait.md)() [ThermostatTrait](https://yonomi.co/yonomi-sdk/ThermostatTrait-class.html)?



   




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed. [...](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)  
_inherited_



##### [notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)() void



Call all the registered listeners. [...](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)  
_@[protected](https://pub.dev/documentation/meta/1.7.0/meta/protected-constant.html), @[visibleForTesting](https://pub.dev/documentation/meta/1.7.0/meta/visibleForTesting-constant.html), inherited_



##### [performAction](../providers_device_provider/DeviceProvider/performAction.md)&lt;T>(T desiredState, [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html) getState, [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html) action, {[GetDeviceDetailsMethod](../providers_device_provider/GetDeviceDetailsMethod.md) getDetails = sdk.DevicesRepository.getDeviceDetails}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



   
_inherited_



##### [removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Remove a previously registered closure from the list of closures that are
notified when the object changes. [...](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)  
_inherited_



##### [setErrorState](../providers_device_provider/DeviceProvider/setErrorState.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) errorMsg) void



   
_inherited_



##### [setFanMode](../providers_thermostat_provider/ThermostatProvider/setFanMode.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, [AvailableFanMode](https://yonomi.co/yonomi-sdk/AvailableFanMode.html) fanMode, {[SetFanModeFunction](../providers_thermostat_provider/SetFanModeFunction.md) setFanMode = ThermostatRepository.setFanMode}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



   




##### [setPointAction](../providers_thermostat_provider/ThermostatProvider/setPointAction.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, [double](https://api.flutter.dev/flutter/dart-core/double-class.html) temperature, {[SetPointActionFunction](../providers_thermostat_provider/SetPointActionFunction.md) setPoint = ThermostatRepository.setPointThermostat}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



   




##### [setThermostatMode](../providers_thermostat_provider/ThermostatProvider/setThermostatMode.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, [AvailableThermostatMode](https://yonomi.co/yonomi-sdk/AvailableThermostatMode.html) mode, {[SetModeFunction](../providers_thermostat_provider/SetModeFunction.md) setMode = ThermostatRepository.setMode}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



   




##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object. [...](https://api.flutter.dev/flutter/dart-core/Object/toString.html)  
_inherited_



##### [trait](../providers_device_provider/DeviceProvider/trait.md)&lt;T extends [Trait](https://yonomi.co/yonomi-sdk/Trait-class.html)>() [Trait](https://yonomi.co/yonomi-sdk/Trait-class.html)?



   
_inherited_




## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator. [...](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)  
_inherited_











