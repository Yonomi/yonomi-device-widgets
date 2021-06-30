


# getOuterPath method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[Path](https://api.flutter.dev/flutter/dart-ui/Path-class.html) getOuterPath
([Rect](https://api.flutter.dev/flutter/dart-ui/Rect-class.html) rect, {[TextDirection](https://api.flutter.dev/flutter/dart-ui/TextDirection-class.html) textDirection})

_inherited_



<p>Create a <a href="https://api.flutter.dev/flutter/dart-ui/Path-class.html">Path</a> that describes the outer edge of the border.</p>
<p>This path must not cross the path given by <a href="../../ui_ring_border/RingBorder/getInnerPath.md">getInnerPath</a> for the same
<a href="https://api.flutter.dev/flutter/dart-ui/Rect-class.html">Rect</a>.</p>
<p>To obtain a <a href="https://api.flutter.dev/flutter/dart-ui/Path-class.html">Path</a> that describes the area of the border itself, set the
<a href="https://api.flutter.dev/flutter/dart-ui/Path/fillType.html">Path.fillType</a> of the returned object to <a href="https://api.flutter.dev/flutter/dart-ui/PathFillType-class.html">PathFillType.evenOdd</a>, and add
to this object the path returned from <a href="../../ui_ring_border/RingBorder/getInnerPath.md">getInnerPath</a> (using
<a href="https://api.flutter.dev/flutter/dart-ui/Path/addPath.html">Path.addPath</a>).</p>
<p>The <code>textDirection</code> argument must be provided non-null if the border
has a text direction dependency (for example if it is expressed in terms
of "start" and "end" instead of "left" and "right"). It may be null if
the border will not need the text direction to paint itself.</p>
<p>See also:</p>
<ul>
<li><a href="../../ui_ring_border/RingBorder/getInnerPath.md">getInnerPath</a>, which creates the path for the inner edge.</li>
<li><a href="https://api.flutter.dev/flutter/dart-ui/Path/contains.html">Path.contains</a>, which can tell if an <a href="https://api.flutter.dev/flutter/dart-ui/Offset-class.html">Offset</a> is within a <a href="https://api.flutter.dev/flutter/dart-ui/Path-class.html">Path</a>.</li>
</ul>



## Implementation

```dart
@override
Path getOuterPath(Rect rect, { TextDirection? textDirection }) {
  return Path()
    ..addOval(Rect.fromCircle(
      center: rect.center,
      radius: rect.shortestSide / 2.0,
    ));
}
```







