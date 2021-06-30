


# autofocus property






[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) autofocus
  
_final, inherited_



<p>True if this widget will be selected as the initial focus when no other
node in its scope is currently focused.</p>
<p>Ideally, there is only one widget with autofocus set in each <code>FocusScope</code>.
If there is more than one widget with autofocus set, then the first one
added to the tree will get focus.</p>
<p>Must not be null. Defaults to false.</p>



## Implementation

```dart
final bool autofocus;


```







