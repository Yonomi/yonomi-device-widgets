


# hasListeners property








[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) hasListeners
  
_@[protected](https://pub.dev/documentation/meta/1.3.0/meta/protected-constant.html), inherited_



<p>Whether any listeners are currently registered.</p>
<p>Clients should not depend on this value for their behavior, because having
one listener's logic change when another listener happens to start or stop
listening will lead to extremely hard-to-track bugs. Subclasses might use
this information to determine whether to do any work when there are no
listeners, however; for example, resuming a <a href="https://api.flutter.dev/flutter/dart-async/Stream-class.html">Stream</a> when a listener is
added and pausing it when a listener is removed.</p>
<p>Typically this is used by overriding <a href="../../providers_lock_provider/LockProvider/addListener.md">addListener</a>, checking if
<a href="../../providers_lock_provider/LockProvider/hasListeners.md">hasListeners</a> is false before calling <code>super.addListener()</code>, and if so,
starting whatever work is needed to determine when to call
<a href="../../providers_lock_provider/LockProvider/notifyListeners.md">notifyListeners</a>; and similarly, by overriding <a href="../../providers_lock_provider/LockProvider/removeListener.md">removeListener</a>, checking
if <a href="../../providers_lock_provider/LockProvider/hasListeners.md">hasListeners</a> is false after calling <code>super.removeListener()</code>, and if
so, stopping that same work.</p>



## Implementation

```dart
@protected
bool get hasListeners {
  assert(_debugAssertNotDisposed());
  return _listeners!.isNotEmpty;
}
```








