


# removeListener method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void removeListener
([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)

_inherited_



<p>Remove a previously registered closure from the list of closures that are
notified when the object changes.</p>
<p>If the given listener is not registered, the call is ignored.</p>
<p>This method must not be called after <a href="../../providers_thermostat_provider/ThermostatProvider/dispose.md">dispose</a> has been called.</p>
<p>If a listener is added twice, and is removed once during an iteration
(e.g. in response to a notification), it will still be called again. If,
on the other hand, it is removed as many times as it was registered, then
it will no longer be called. This odd behavior is the result of the
<code>ChangeNotifier</code> not being able to determine which listener is being
removed, since they are identical, therefore it will conservatively still
call all the listeners when it knows that any are still registered.</p>
<p>This surprising behavior can be unexpectedly observed when registering a
listener on two separate objects which are both forwarding all
registrations to a common upstream object.</p>
<p>See also:</p>
<ul>
<li><a href="../../providers_thermostat_provider/ThermostatProvider/addListener.md">addListener</a>, which registers a closure to be called when the object
changes.</li>
</ul>



## Implementation

```dart
@override
void removeListener(VoidCallback listener) {
  assert(_debugAssertNotDisposed());
  for (final _ListenerEntry entry in _listeners!) {
    if (entry.listener == listener) {
      entry.unlink();
      return;
    }
  }
}
```







