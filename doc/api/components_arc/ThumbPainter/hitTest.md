


# hitTest method








[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) hitTest
([Offset](https://api.flutter.dev/flutter/dart-ui/Offset-class.html) position)

_inherited_



<p>Called whenever a hit test is being performed on an object that is using
this custom paint delegate.</p>
<p>The given point is relative to the same coordinate space as the last
<a href="../../components_arc/ThumbPainter/paint.md">paint</a> call.</p>
<p>The default behavior is to consider all points to be hits for
background painters, and no points to be hits for foreground painters.</p>
<p>Return true if the given position corresponds to a point on the drawn
image that should be considered a "hit", false if it corresponds to a
point that should be considered outside the painted image, and null to use
the default behavior.</p>



## Implementation

```dart
bool? hitTest(Offset position) => null;
```







