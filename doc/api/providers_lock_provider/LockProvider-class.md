


# LockProvider class











**Inheritance**

- [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
- [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)
- LockProvider






## Constructors

[LockProvider](../providers_lock_provider/LockProvider/LockProvider.md) ([Request](https://pub.dev/documentation/yonomi_platform_sdk/1.0.5/request_request/Request-class.html) request, [String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetLockDetailsFunction](../providers_lock_provider/GetLockDetailsFunction.md) injectLockDetailsMethod})

    


## Properties

##### [deviceDetail](../providers_lock_provider/LockProvider/deviceDetail.md) &#8594; [Device](https://pub.dev/documentation/yonomi_platform_sdk/1.0.5/repository_devices_devices_repository/Device-class.html)



   
_read-only_



##### [hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html) &#8594; [int](https://api.flutter.dev/flutter/dart-core/int-class.html)



The hash code for this object. [...](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)  
_read-only, inherited_



##### [hasListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



Whether any listeners are currently registered. [...](https://api.flutter.dev/flutter/foundation/ChangeNotifier/hasListeners.html)  
_@[protected](https://pub.dev/documentation/meta/1.3.0/meta/protected-constant.html), read-only, inherited_



##### [isLocked](../providers_lock_provider/LockProvider/isLocked.md) &#8594; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



   
_read-only_



##### [loadingAction](../providers_lock_provider/LockProvider/loadingAction.md) &#8596; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



   
_read / write_



##### [loadingDetail](../providers_lock_provider/LockProvider/loadingDetail.md) &#8596; [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



   
_read / write_



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
_@[mustCallSuper](https://pub.dev/documentation/meta/1.3.0/meta/mustCallSuper-constant.html), inherited_



##### [getDeviceDetail](../providers_lock_provider/LockProvider/getDeviceDetail.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, {[GetLockDetailsFunction](../providers_lock_provider/GetLockDetailsFunction.md) injectLockDetailsMethod}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



   




##### [getLockTrait](../providers_lock_provider/LockProvider/getLockTrait.md)() [LockUnlockTrait](https://pub.dev/documentation/yonomi_platform_sdk/1.0.5/repository_devices_devices_repository/LockUnlockTrait-class.html)



   




##### [noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)([Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html) invocation) dynamic



Invoked when a non-existent method or property is accessed. [...](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)  
_inherited_



##### [notifyListeners](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)() void



Call all the registered listeners. [...](https://api.flutter.dev/flutter/foundation/ChangeNotifier/notifyListeners.html)  
_@[protected](https://pub.dev/documentation/meta/1.3.0/meta/protected-constant.html), @[visibleForTesting](https://pub.dev/documentation/meta/1.3.0/meta/visibleForTesting-constant.html), inherited_



##### [removeListener](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener) void



Remove a previously registered closure from the list of closures that are
notified when the object changes. [...](https://api.flutter.dev/flutter/foundation/ChangeNotifier/removeListener.html)  
_inherited_



##### [setLockUnlockAction](../providers_lock_provider/LockProvider/setLockUnlockAction.md)([String](https://api.flutter.dev/flutter/dart-core/String-class.html) deviceId, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) setLock, {[GetLockDetailsFunction](../providers_lock_provider/GetLockDetailsFunction.md) injectLockDetailsMethod, [SendLockUnlockFunction](../providers_lock_provider/SendLockUnlockFunction.md) injectSendLockUnlockMethod}) [Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void>



   




##### [toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)() [String](https://api.flutter.dev/flutter/dart-core/String-class.html)



A string representation of this object. [...](https://api.flutter.dev/flutter/dart-core/Object/toString.html)  
_inherited_




## Operators

##### [operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other) [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)



The equality operator. [...](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)  
_inherited_











