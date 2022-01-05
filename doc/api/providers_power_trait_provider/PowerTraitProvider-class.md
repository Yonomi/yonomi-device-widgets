


# PowerTraitProvider class






    *[<Null safety>](https://dart.dev/null-safety)*





**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- PowerTraitProvider






## Constructors

[PowerTraitProvider](../providers_power_trait_provider/PowerTraitProvider/PowerTraitProvider.md) ([Request](https://yonomi.co/yonomi-sdk/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetDeviceDetailsMethod](../providers_power_trait_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails})

    


## Properties

##### [deviceDetail](../providers_power_trait_provider/PowerTraitProvider/deviceDetail.md) &#8594; [Device](https://yonomi.co/yonomi-sdk/Device-class.html)?



   
_read-only_



##### [getErrorMessage](../providers_power_trait_provider/PowerTraitProvider/getErrorMessage.md) &#8594; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



Get the error message whenever this ChangeNotifier had an error
See also: <a href="../providers_power_trait_provider/PowerTraitProvider/isInErrorState.md">isInErrorState</a>   
_read-only_



##### [getOnOffState](../providers_power_trait_provider/PowerTraitProvider/getOnOffState.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



   
_read-only_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object. [...](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)  
_read-only, inherited_



##### [hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether any listeners are currently registered. [...](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)  
_@[protected](https://pub.dev/documentation/meta/1.7.0/meta/protected-constant.html), read-only, inherited_



##### [isBusy](../providers_power_trait_provider/PowerTraitProvider/isBusy.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



To know if this ChangeNotifier is busy from fetching data or running an action   
_read-only_



##### [isInErrorState](../providers_power_trait_provider/PowerTraitProvider/isInErrorState.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



To know if this ChangeNotifier had an error
see <a href="../providers_power_trait_provider/PowerTraitProvider/getErrorMessage.md">getErrorMessage</a> to get the accomponying error message   
_read-only_



##### [isLoading](../providers_power_trait_provider/PowerTraitProvider/isLoading.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



To know if this ChangeNotifier is fetching device data   
_read-only_



##### [isPerformingAction](../providers_power_trait_provider/PowerTraitProvider/isPerformingAction.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



To know if this ChangeNotifier is performing an action   
_read-only_



##### [runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html) &#8594; [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)



A representation of the runtime type of the object.   
_read-only, inherited_




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



##### [fetchData](../providers_power_trait_provider/PowerTraitProvider/fetchData.md)({[GetDeviceDetailsMethod](../providers_power_trait_provider/GetDeviceDetailsMethod.md) getDeviceDetails = DevicesRepository.getDeviceDetails}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



Fetches device data. When loaded, get the data with <code>getDeviceDetails</code> [...](../providers_power_trait_provider/PowerTraitProvider/fetchData.md)  




##### [getPowerTrait](../providers_power_trait_provider/PowerTraitProvider/getPowerTrait.md)() [PowerTrait](https://yonomi.co/yonomi-sdk/PowerTrait-class.html)?



   




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed. [...](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)  
_inherited_



##### [notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)() void



Call all the registered listeners. [...](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)  
_@[protected](https://pub.dev/documentation/meta/1.7.0/meta/protected-constant.html), @[visibleForTesting](https://pub.dev/documentation/meta/1.7.0/meta/visibleForTesting-constant.html), inherited_



##### [removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Remove a previously registered closure from the list of closures that are
notified when the object changes. [...](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)  
_inherited_



##### [sendPowerOnOffAction](../providers_power_trait_provider/PowerTraitProvider/sendPowerOnOffAction.md)([bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) desiredOnOffState, {[GetDeviceDetailsMethod](../providers_power_trait_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails, [SendPowerMethod](../providers_power_trait_provider/SendPowerMethod.md) sendPowerMethod = PowerRepository.sendPowerAction}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



Run the "makePowerActionRequest" mutation on this device [...](../providers_power_trait_provider/PowerTraitProvider/sendPowerOnOffAction.md)  




##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object. [...](https://api.flutter.dev/flutter/dart-core/Object/toString.html)  
_inherited_




## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator. [...](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)  
_inherited_






## Constants

##### [MAX_RETRIES](../providers_power_trait_provider/PowerTraitProvider/MAX_RETRIES-constant.md) const [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



   




##### [RETRY_DELAY_MS](../providers_power_trait_provider/PowerTraitProvider/RETRY_DELAY_MS-constant.md) const [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



   









