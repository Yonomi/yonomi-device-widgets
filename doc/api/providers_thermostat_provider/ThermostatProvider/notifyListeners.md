


# notifyListeners method







- @[protected](https://pub.dev/documentation/meta/1.3.0/meta/protected-constant.html)
- @[visibleForTesting](https://pub.dev/documentation/meta/1.3.0/meta/visibleForTesting-constant.html)

void notifyListeners
()

_@[protected](https://pub.dev/documentation/meta/1.3.0/meta/protected-constant.html), @[visibleForTesting](https://pub.dev/documentation/meta/1.3.0/meta/visibleForTesting-constant.html), inherited_



<p>Call all the registered listeners.</p>
<p>Call this method whenever the object changes, to notify any clients the
object may have changed. Listeners that are added during this iteration
will not be visited. Listeners that are removed during this iteration will
not be visited after they are removed.</p>
<p>Exceptions thrown by listeners will be caught and reported using
<code>FlutterError.reportError</code>.</p>
<p>This method must not be called after <a href="../../providers_thermostat_provider/ThermostatProvider/dispose.md">dispose</a> has been called.</p>
<p>Surprising behavior can result when reentrantly removing a listener (e.g.
in response to a notification) that has been registered multiple times.
See the discussion at <a href="../../providers_thermostat_provider/ThermostatProvider/removeListener.md">removeListener</a>.</p>



## Implementation

```dart
@protected
@visibleForTesting
void notifyListeners() {
  assert(_debugAssertNotDisposed());
  if (_listeners!.isEmpty)
    return;

  final List<_ListenerEntry> localListeners = List<_ListenerEntry>.from(_listeners!);

  for (final _ListenerEntry entry in localListeners) {
    try {
      if (entry.list != null)
        entry.listener();
    } catch (exception, stack) {
      FlutterError.reportError(FlutterErrorDetails(
        exception: exception,
        stack: stack,
        library: 'foundation library',
        context: ErrorDescription('while dispatching notifications for $runtimeType'),
        informationCollector: () sync* {
          yield DiagnosticsProperty<ChangeNotifier>(
            'The $runtimeType sending notification was',
            this,
            style: DiagnosticsTreeStyle.errorProperty,
          );
        },
      ));
    }
  }
}
```







