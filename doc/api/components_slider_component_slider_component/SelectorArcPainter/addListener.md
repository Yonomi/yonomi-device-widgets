


# addListener method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void addListener
([VoidCallback](https://api.flutter.dev/flutter/dart-ui/VoidCallback.html) listener)

_inherited_



<p>Register a closure to be notified when it is time to repaint.</p>
<p>The <code>CustomPainter</code> implementation merely forwards to the same method on
the <code>Listenable</code> provided to the constructor in the <code>repaint</code> argument, if
it was not null.</p>



## Implementation

```dart
@override
void addListener(VoidCallback listener) => _repaint?.addListener(listener);
```







