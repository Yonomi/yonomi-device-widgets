


# LockProvider class






    *[<Null safety>](https://dart.dev/null-safety)*





**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- [DeviceProvider](../providers_device_provider/DeviceProvider-class.md)
- LockProvider






## Constructors

[LockProvider](../providers_lock_provider/LockProvider/LockProvider.md) ([Request](https://yonomi.co/yonomi-sdk/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetDeviceDetailsMethod](../providers_device_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails})

    


## Properties

##### [deviceDetail](../providers_device_provider/DeviceProvider/deviceDetail.md) &#8594; [Device](https://yonomi.co/yonomi-sdk/Device-class.html)?



   
_read-only, inherited_



##### [displayName](../providers_lock_provider/LockProvider/displayName.md) &#8594; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



   
_read-only, override_



##### [getErrorMessage](../providers_device_provider/DeviceProvider/getErrorMessage.md) &#8594; [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



Get the error message whenever this ChangeNotifier had an error
See also: <a href="../providers_device_provider/DeviceProvider/isInErrorState.md">isInErrorState</a>   
_read-only, inherited_



##### [getIsJammedState](../providers_lock_provider/LockProvider/getIsJammedState.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



   
_read-only_



##### [getIsLockedState](../providers_lock_provider/LockProvider/getIsLockedState.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



   
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



##### [getLockTrait](../providers_lock_provider/LockProvider/getLockTrait.md)() [LockTrait](https://yonomi.co/yonomi-sdk/LockTrait-class.html)?



   




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



##### [setLockUnlockAction](../providers_lock_provider/LockProvider/setLockUnlockAction.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) setLock, {[GetDeviceDetailsMethod](../providers_device_provider/GetDeviceDetailsMethod.md) getDetails = DevicesRepository.getDeviceDetails, [SendLockUnlockFunction](../providers_lock_provider/SendLockUnlockFunction.md) sendLockUnlock = LockRepository.sendLockUnlockAction}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



   




##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object. [...](https://api.flutter.dev/flutter/dart-core/Object/toString.html)  
_inherited_



##### [trait](../providers_device_provider/DeviceProvider/trait.md)&lt;T extends [Trait](https://yonomi.co/yonomi-sdk/Trait-class.html)>() [Trait](https://yonomi.co/yonomi-sdk/Trait-class.html)?



   
_inherited_




## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator. [...](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)  
_inherited_











