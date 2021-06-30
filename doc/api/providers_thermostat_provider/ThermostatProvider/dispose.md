


# dispose method







- @[mustCallSuper](https://pub.dev/documentation/meta/1.3.0/meta/mustCallSuper-constant.html)

void dispose
()

_@[mustCallSuper](https://pub.dev/documentation/meta/1.3.0/meta/mustCallSuper-constant.html), inherited_



<p>Discards any resources used by the object. After this is called, the
object is not in a usable state and should be discarded (calls to
<a href="../../providers_thermostat_provider/ThermostatProvider/addListener.md">addListener</a> and <a href="../../providers_thermostat_provider/ThermostatProvider/removeListener.md">removeListener</a> will throw after the object is
disposed).</p>
<p>This method should only be called by the object's owner.</p>



## Implementation

```dart
@mustCallSuper
void dispose() {
  assert(_debugAssertNotDisposed());
  _listeners = null;
}
```







